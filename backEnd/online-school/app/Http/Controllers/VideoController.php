<?php

namespace App\Http\Controllers;

use App\Models\Teacher;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;


class VideoController extends Controller
{

    public function indexVideo()
    {
        $videos = Video::all();

        return response()->json([
            "success" => true,
            "message" => "video recived successfully.",
            "date" =>  $videos,
        ]);
    }

    public function storeVideoTeacher(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
            'img' => 'required|string',
            'isIntro' => 'required|boolean',
            'description' => 'required|string',
            'url' => 'required|string',
            'course_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $user = Auth::user();

        $product = new Video();
        $product->name = $request->name;
        $image = $request->img;
        $image = str_replace('data:image/png;base64,', '', $image);
        $image = str_replace(' ', '+', $image);
        $imageName = '/VideoImages/' . date('YmdHi') . '.' . 'png';
        Storage::disk('local')->put($imageName, base64_decode($image));
        $product->isIntro = $request->isIntro;
        $product->img = $imageName;
        $product->descirption = $request->description;
        $product->url = $request->url;
        $product->course_id = $request->course_id;
        $product->teacher_id =  $user->id;
        $product->save();
        return response()->json([
            "success" => true,
            "message" => "Video Add successfully.",
        ]);
    }


    public function showVideoStudent(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the id.",
                "item" => []
            ]);
        }
        $product = Video::find($request->id);
        if (is_null($product)) {
            return response()->json([
                "success" => false,
                "message" => "video Not Find.",
                "item" => []
            ]);
        }
        $teacher = Teacher::find($product->teacher_id);
        $teacher->viewer_quntity =   $teacher->viewer_quntity + 1;
        $product->viewer_quntity =  $product->viewer_quntity + 1;
        $product->save();
        return response()->json([
            "success" => true,
            "message" => "video retrieved successfully.",
            "item" => $product
        ]);
    }
    public function showVideoTeacher(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the id.",
                "item" => []
            ]);
        }
        $product = Video::find($request->id);
        if (is_null($product)) {
            return response()->json([
                "success" => false,
                "message" => "video Not Find.",
                "item" => []
            ]);
        }
        return response()->json([
            "success" => true,
            "message" => "video retrieved successfully.",
            "item" => $product
        ]);
    }

    public function teacherUpdateVideo(Request $request, Video $video)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required|string',
            'img' => 'required|string',
            'url' => 'required|string',
            'description' => 'required|string',
            'id' => 'required|numeric',
            'isIntro' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the fildes.",
                "data" => []
            ]);
        }

        DB::beginTransaction();
        $product = Video::where('id', '=', $request->id)->first();
        if ($product) {

            $product->name = $input['name'];
            $product->url = $input['url'];
            $product->description = $input['description'];
            $product->isIntro = $input['isIntro'];
            $path = substr($product->img, 13, Str::length($product->img));
            unlink(public_path() . '\\storage\\VideoImages\\' . $path);
            $image = $request->img;
            $image = str_replace('data:image/png;base64,', '', $image);
            $image = str_replace(' ', '+', $image);
            $imageName = '/VideoImages/' . date('YmdHi') . '.' . 'png';
            Storage::disk('local')->put($imageName, base64_decode($image));
            $product->img = $imageName;
        }
        $product->save();
        DB::commit();

        return response()->json([
            "success" => true,
            "message" => "Category updated successfully.",
            "data" => $product
        ]);
    }

    public function destroyVideoTeacher(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        DB::beginTransaction();
        $product = Video::find($request->id);
        if ($product) {
            $path = substr($product->img, 13, Str::length($product->img));
            unlink(public_path() . '\\storage\\VideoImages\\' . $path);
            $product->delete();
            DB::commit();
            return response()->json([
                "success" => true,
                "message" => "video deleted successfully.",
            ]);
        } else {
            return response()->json([
                "success" => true,
                "message" => "video not exit.",
            ]);
        }
    }

    public function searchVideoTeacher(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
        $user = Auth::user();
        $product = Video::select('img', 'name', 'id')
            ->where('teacher_id',  $user->id)
            ->Where('name', 'like', "%{$request->name}%")->get();
        return response()->json([
            "success" => true,
            "message" => "Course Added successfully.",
            "data" => $product
        ]);
    }

    public function searchCourseVideosTeacher(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
        $user = Auth::user();
        $product = Video::select('img', 'name', 'id')
            ->where('teacher_id',  $user->id)
            ->where('course_id',  $request->id)
            ->Where('name', 'like', "%{$request->name}%")->get();
        return response()->json([
            "success" => true,
            "message" => "video resulte.",
            "data" => $product
        ]);
    }
    
    public function searchCourseVideosStudent(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
        $product = Video::select('img', 'name', 'id')->where('course_id',  $request->id)
            ->Where('name', 'like', "%{$request->name}%")->get();
        return response()->json([
            "success" => true,
            "message" => "video resulte.",
            "data" => $product
        ]);
    }
}
