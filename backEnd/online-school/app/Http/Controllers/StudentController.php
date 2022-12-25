<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    public function getProfileStudent()
    {
        $user = Auth::user();
        $product = Student::where('user_id', $user->id)->first();
        return response()->json([
            "success" => true,
            "message" => "student resive",
            "student" => $product,
            "user" =>  $user,
        ]);
    }

    public function indexStudent(Request $request)
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
        $products = Student::select('students.id', 'students.package', 'users.firstName', 'users.lastName', 'users.email')
            ->join('users', 'users.id', 'students.user_id')
            ->orderBy($request->filter)
            ->get();

        return response()->json([
            "success" => true,
            "studentIndex" => $products
        ]);
    }

    public function showStudentProfile(Request $request)
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
        $student = Student::find($request->id);

        if (is_null($student)) {
            return response()->json([
                "success" => false,
                "message" => "Student Not Find.",
            ]);
        }
        $userStudent = User::find($student->user_id);
        return response()->json([
            "success" => true,
            "student" =>  $student,
            "userStudent" => $userStudent,

        ]);
    }
    public function searchStudents(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => true,
                "students" => []
            ]);
        }
        $students = Student::select('students.id', 'users.email', 'users.firstName', 'users.lastName')
            ->join('users', 'users.id', 'students.user_id')
            ->Where('users.firstName', 'like', "%{$request->name}%")
            ->orWhere('users.lastName', 'like', "%{$request->name}%")
            ->orWhere('users.email', 'like', "%{$request->name}%")
            ->get();
        return response()->json([
            "success" => true,
            "students" => $students
        ]);
    }

    public function studentUpdateProfile(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'firstName' => 'required|string',
            'lastName' => 'required|string',
            'phone' => 'required|numeric',
            'telegram' => 'string',
            'dio' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the fildes.",
                "data" => []
            ]);
        }
        $user = Auth::user();
        $product = Student::where('user_id', '=', $user->id)->first();
        $user = User::where('id', '=', $user->id)->first();
        if ($product) {
            DB::beginTransaction();
            $user->firstName = $request->firstName;
            $user->lastName = $request->lastName;
            $product->phone = $request->phone;
            $product->telegram = $request->telegram;
            $product->dio = $request->dio;
            $product->save();
            $user->save();
            DB::commit();
            return response()->json([
                "success" => true,
                "message" => "student updated successfully.",
                "student" => $product,
                "user" => $user
            ]);
        } else {
            return response()->json([
                "success" => true,
                "message" => "student not found.",
            ]);
        }
    }
    public function adminStudentUpdateProfile(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'firstName' => 'required|string',
            'lastName' => 'required|string',
            'phone' => 'required|numeric',
            'id' => 'required|numeric',
            'telegram' => 'string',
            'dio' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the fildes.",
                "data" => []
            ]);
        }
        DB::beginTransaction();

        $user = User::where('id', $request->id)->first();
        $user->firstName = $request->firstName;
        $user->lastName = $request->lastName;
        $user->save();

        $student = Student::where('user_id', $request->id)->first();
        $student->phone = $request->phone;
        $student->telegram = $request->telegram;
        $student->dio = $request->dio;
        $student->save();


        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "student update successfully.",
        ]);
    }


    public function deleteStudent(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        DB::beginTransaction();
        Student::where('user_id', $request->id)->first()->delete();
        User::find($request->id)->delete();
        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "student deleted successfully.",
        ]);
    }
}
