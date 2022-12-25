<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Teacher;
use App\Models\User;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Events\StatusLiked;

class CourseController extends Controller
{
    public function indexCoursesStudent()
    {
        $data = Course::select(
            'courses.img',
            'courses.name',
            'courses.id',
            'courses.category',
            'courses.viewer_quntity',
            'courses.number_of_videos',
            'courses.teacher_id',
            'teachers.img as teacherImage'
        )
            ->join('users', 'users.id', 'courses.teacher_id')
            ->join('teachers', 'teachers.user_id', 'users.id')
            ->orderBy('teachers.id')
            ->get();

        return response()->json([
            "success" => true,
            "message" => "Product List",
            "courses" =>  $data
        ]);
    }

    public function indexCoursesTeacher()
    {
        $user = Auth::user();
        // $teacher  = Teacher::select(
        //     'id',
        // )->where('user_id',  $user->id)
        //     ->first();
        $products  = Course::select(
            'name',
            'img',
            'id',
        )->where('teacher_id',  $user->id)
            ->get();
        return response()->json([
            "success" => true,
            "message" => "Product List",
            "data" => $products
        ]);
    }

    public function searchTeacher(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
        $user = Auth::user();
        $product = Course::select('img', 'name', 'id')
            ->where('teacher_id',  $user->id)
            ->Where('name', 'like', "%{$request->name}%")->get();
        return response()->json([
            "success" => true,
            "message" => "Course Added successfully.",
            "data" => $product
        ]);
    }

    public function searchStudent(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }

        $product = Course::select('img', 'name', 'id')
            ->Where('name', 'like', "%{$request->name}%")
            ->orWhere('created_at', 'like', "%{$request->name}%")
            ->orWhere('category', 'like', "%{$request->name}%")->get();
        return response()->json([
            "success" => true,
            "message" => "Course Added successfully.",
            "data" => $product
        ]);
    }

    public function storeCourseTeacher(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
            'img' => 'required',
            'category' => 'required|string|max:20',
            'expected_time_to_finsh' => 'required|string|max:12',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
        $user = Auth::user();
        $product = new Course();
        $product->teacher_id = $user->id;
        $product->name = $request->name;
        $product->expected_time_to_finsh = $request->expected_time_to_finsh;
        $product->category = $request->category;
        $image = $request->img;
        $image = str_replace('data:image/png;base64,', '', $image);
        $image = str_replace(' ', '+', $image);
        $imageName = '/CourseImages/' . date('YmdHi') . '.' . 'png';
        Storage::disk('local')->put($imageName, base64_decode($image));
        $product->img = $imageName;
        $product->save();
        return response()->json([
            "success" => true,
            "message" => "Course Added successfully.",
            "data" => $product
        ]);
    }

    public function showStudent(Request $request)
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
        $data = Course::select('courses.img', 'courses.name', 'courses.id', 'courses.viewer_quntity', 'courses.number_of_videos', 'courses.teacher_id','courses.expected_time_to_finsh', 'teachers.img as teacherImage')
            ->join('users', 'users.id', 'courses.teacher_id')
            ->join('teachers', 'teachers.user_id', 'users.id')
            ->where('courses.id', $request->id)
            ->orderBy('teachers.id')
            ->first();

        if (is_null($data)) {
            return response()->json([
                "success" => false,
                "message" => "Product Not Find.",
                "item" => []
            ]);
        }

        $teacher = User::select('firstName', 'lastName')
            ->where('id', $data->teacher_id)
            ->first();

        $video  = Video::select('img', 'name', 'id', 'isIntro')
            ->where('course_id', $request->id)
            ->get();

        return response()->json([
            "success" => true,
            "message" => "Product retrieved successfully.",
            "courseStudent" =>  $data,
            "videosStudent" => $video,
            "TeacherInfo" => $teacher
        ]);
    }

    public function showTeacherCourse(Request $request)
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
        $product = Course::select('img', 'name', 'viewer_quntity', 'number_of_videos', 'expected_time_to_finsh', 'id')
            ->where('id', $request->id)
            ->first();
        if (is_null($product)) {
            return response()->json([
                "success" => false,
                "message" => "Product Not Find.",
                "item" => []
            ]);
        }
        $video  = Video::select('img', 'name', 'id', 'isIntro')->where('course_id', $request->id)
            ->get();

        return response()->json([
            "success" => true,
            "message" => "course retrieved successfully.",
            "course" => $product,
            "videos" => $video
        ]);
    }
    public function updateCourseTeacher(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required|string',
            'img' => 'required|string',
            'category' => 'required|string',
            'expected_time_to_finsh' => 'required|string',
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the fildes.",
                "data" => []
            ]);
        }
        $product = Course::where('id', '=', $request->id)->first();
        if ($product) {
            DB::beginTransaction();
            $product->name = $request->name;
            $product->category = $request->category;
            $product->expected_time_to_finsh = $request->expected_time_to_finsh;
            $path = substr($product->img, 14, Str::length($product->img));
            unlink(public_path() . '\\storage\\CourseImages\\' . $path);
            $image = $request->img;
            $image = str_replace('data:image/png;base64,', '', $image);
            $image = str_replace(' ', '+', $image);
            $imageName = '/CourseImages/' . date('YmdHi') . '.' . 'png';
            Storage::disk('local')->put($imageName, base64_decode($image));
            $product->img = $imageName;
            $product->save();
            DB::commit();
            return response()->json([
                "success" => true,
                "message" => "Course updated successfully.",
                "data" => $product
            ]);
        } else {
            return response()->json([
                "success" => true,
                "message" => "Course not found.",
                "data" => $product
            ]);
        }
    }
    public function destroyTeacherCourse(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $product = Course::find($request->id);
        if ($product) {
            DB::beginTransaction();

            $path = substr($product->img, 14, Str::length($product->img));
            unlink(public_path() . '\\storage\\CourseImages\\' . $path);
            $product->delete();
            DB::commit();
            return response()->json([
                "success" => true,
                "message" => "course deleted successfully.",
                "data" => []
            ]);
        } else {
            return response()->json([
                "success" => false,
                "message" => "course not found.",
            ]);
        }
    }
}
