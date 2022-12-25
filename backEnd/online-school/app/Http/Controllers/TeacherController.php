<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\Teacher;
use App\Models\Course;
use App\Models\User;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class TeacherController extends Controller
{

    public function indexTeacher(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'filter' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the id.",

            ]);
        }
        $products = Teacher::select('teachers.id', 'teachers.img', 'users.firstName', 'users.lastName')
            ->join('users', 'users.id', 'teachers.user_id')
            ->orderBy($request->filter)
            ->get();

        return response()->json([
            "success" => true,
            "data" => $products
        ]);
    }

    public function getTeacherProfile()
    {
        $user = Auth::user();
        $product = Teacher::where('user_id', $user->id)->first();
        return response()->json([
            "success" => true,
            "message" => "Teacher resive",
            "teacher" => $product,
            "user" =>  $user,
        ]);
    }

    public function showTeacherProfile(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the id.",
            ]);
        }
        $teacher = Teacher::find($request->id);

        if (is_null($teacher)) {
            return response()->json([
                "success" => false,
                "message" => "Student Not Find.",
            ]);
        }
        $userTeacher = User::find($teacher->user_id);
        $courses = Course::select('name', 'id', 'img')->where('teacher_id', $teacher->user_id)->get();
        return response()->json([
            "success" => true,
            "teacher" =>  $teacher,
            "userteacher" =>  $userTeacher,
            "teacherCourses" =>   $courses,

        ]);
    }

    public function searchTeachers(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => true,
            ]);
        }
        $teachers = Teacher::select('teachers.id', 'teachers.img', 'users.id as user_id', 'users.firstName', 'users.lastName')
            ->join('users', 'users.id', 'teachers.user_id')
            ->Where('users.firstName', 'like', "%{$request->name}%")
            ->orWhere('users.lastName', 'like', "%{$request->name}%")
            ->orWhere('users.email', 'like', "%{$request->name}%")
            ->get();
        return response()->json([
            "success" => true,
            "teachers" => $teachers
        ]);
    }


    public function updateTeacherProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'img' => 'required|string',
            'telegram' => 'string|max:80',
            'dio' => 'required|string|max:400',
            'phone' => 'required|numeric|min:10',
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        DB::beginTransaction();
        DB::table('users')
            ->where('id', $request->id)
            ->update(['firstName' => $request->firstName], ['lastName' => $request->lastName]);
        $teacher = Teacher::where('user_id', $request->id)->first();
        $path = substr($teacher->img, 14, Str::length($teacher->img));
        unlink(public_path() . '\\storage\\TeacherImage\\' . $path);
        $image = $request->img;
        $image = str_replace('data:image/png;base64,', '', $image);
        $image = str_replace(' ', '+', $image);
        $imageName = '/TeacherImage/' . date('YmdHi') . '.' . 'png';
        Storage::disk('local')->put($imageName, base64_decode($image));
        DB::table('teachers')
            ->where('user_id', $request->id)
            ->update(
                ['telegram' => $request->telegram],
                ['dio' => $request->dio],
                ['phone' => $request->phone],
                ['img' => $request->imageName]
            );
        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "teacher update successfully.",
        ]);
    }


    public function destroyTeacher(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        DB::beginTransaction();
        $user = User::where('id', $request->id)->first();
        $tercher = Teacher::where('user_id', $request->id)->first();
        Video::where('teacher_id',  $tercher->id)->delete();
        Course::where('teacher_id', $request->id)->delete();
        $path = substr($tercher->img, 14, Str::length($tercher->img));
      //  unlink(public_path() . '\\storage\\TeacherImage\\' . $path);
        $tercher->delete();
        $user->delete();
        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "teacher deleted successfully.",
        ]);
    }
}
