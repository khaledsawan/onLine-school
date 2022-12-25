<?php

namespace App\Http\Controllers\Auth;

use Exception;
use App\Models\User;
use App\Models\Admin;
use App\Mail\RegisterUserMail;
use App\Models\Student;
use App\Models\TokenUser;
use App\Models\Teacher;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Response;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Events\Verified;
use Illuminate\Support\Facades\Password;
use Illuminate\Mail\Message;
use Carbon\Carbon;

class ApiAuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $user = User::where('email', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
                $response = ['token' => $token, 'role' => $user->role];
                return response($response, 200);
            } else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" => 'User does not exist'];
            return response($response, 422);
        }
    }

    public function registerStudent(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'telegram' => 'string|max:80',
            'dio' => 'required|string|max:500',
            'phone' => 'required|numeric|min:10',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $request['password'] = Hash::make($request['password']);
        $user = new User();
        $user->firstName = $request->firstName;
        $user->lastName = $request->lastName;
        $user->email = $request->email;
        $user->password = $request['password'];
        $user->role = 'student';
        $user->save();

        $student = new Student();
        $student->telegram = $request['telegram'];
        $student->dio = $request['dio'];
        $student->phone = $request['phone'];
        $student->user_id = $user->id;
        $student->save();
        $token = $user->createToken('235464576456')->accessToken;

        if($user)
        {

            $token=random_int(1000,9999);
            $newToken=new TokenUser();
            $newToken->user_id=$user->id;
            $newToken->token=$token;
            $newToken->save();
            Mail::to(users:$user->email)->send(new RegisterUserMail($user,$token));
        }
        $success['token']=$token;
       // return $this->sendResponse($success, 'register send email');
      //  $user->sendEmailVerificationNotification();
       $response = ['massage' =>'register send email'];
       return response($response, 200);
    }
    public function ActivateEmail(Request $request)
    {

        $validator=Validator::make(
            $request->all(),
            [
                'token'=>'required|exists:token_users,token',
             ]);
            if ($validator->fails())
            {
                return response(['errors' => $validator->errors()->all()], 422);
            }
        $checkToken=TokenUser::where(['token'=>$request->token])->first();
        if ($checkToken)
        {
            $user_id=$checkToken->user_id;
            $user=User::where(['id'=>$user_id])->first();
            $user->email_verified_at=Carbon::now();
            $user->save();
            // to delete activate  $checkToken->delete();
            //notify (database,broadcast)
           // $user->notify(new ActivateEmail($user));
            $success['token'] = $user->createToken('usersocial')->accessToken;
            $success['id'] = $user->id;
            $success['email'] = $user->email;
            $checkToken->delete();
            $response = ['token'=>$success['token'],'role' => $user->role];
            return response($response, 200);
        }
    }

    public function registerTeacher(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'img' => 'required|string',
            'telegram' => 'string|max:80',
            'dio' => 'required|string|max:400',
            'phone' => 'required|numeric|min:10',
            'email' => 'required|string|email|max:255|unique:users', //
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $request['password'] = Hash::make($request['password']);
        $user = new User();
        $user->firstName = $request->firstName;
        $user->lastName = $request->lastName;
        $user->email = $request->email;
        $user->password = $request['password'];
        $user->role = 'teacher';

        $image = $request->img;
        $image = str_replace('data:image/png;base64,', '', $image);
        $image = str_replace(' ', '+', $image);
        $imageName = '/TeacherImage/' . date('YmdHi') . '.' . 'png';
        Storage::disk('local')->put($imageName, base64_decode($image));
        $user->save();
        $teacher = new Teacher();
        $teacher->img = $imageName;
        $teacher->telegram = $request->telegram;
        $teacher->dio = $request->dio;
        $teacher->phone = $request->phone;
        $teacher->user_id = $user->id;
        $teacher->save();

        $token = $user->createToken('235464576456')->accessToken;

        $response = ["token" =>   $token, 'role' => $user->role];
        return response($response, 200);
    }

    public function registerAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'functional_level' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $request['password'] = Hash::make($request['password']);
        $user = new User();
        $user->firstName = $request->firstName;
        $user->lastName = $request->lastName;
        $user->email = $request->email;
        $user->password = $request['password'];
        $user->role = 'admin';
        $user->save();

        $admin = new Admin();
        $admin->firstName = $request['firstName'];
        $admin->lastName = $request['lastName'];
        $admin->email = $request['email'];
        $admin->password = $request['password'];
        $admin->functional_level = $request['functional_level'];
        $admin->user_id = $user->id;
        $admin->save();
        $token = $user->createToken('lkzdnfl9765kjdsgafk234jlk2345sLKasdasd546waed')->accessToken;
        $response = ['token' => $token, 'role' => $user->role];
        return response($response, 200);
    }
    public function logout(Request $request)
    {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }

    public function forgot_password(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'email' => "required|email",
        );
        $validator = Validator::make($input, $rules);
        if ($validator->fails()) {
            $arr = array("status" => 400, "message" => $validator->errors()->first(), "data" => array());
        } else {
            try {
                $response =   Password::sendResetLink($request->only('email'));// Password::sendResetLink($request->only('email'), function (Message $message) {
                 //   $message->subject($this->getEmailSubject());
               // });
                switch ($response) {
                    case Password::RESET_LINK_SENT:
                        return response()->json(array("status" => 200, "message" => trans($response), "data" => array()));
                    case Password::INVALID_USER:
                        return response()->json(array("status" => 400, "message" => trans($response), "data" => array()));
                }
            } catch (\Swift_TransportException $ex) {
                $arr = array("status" => 400, "message" => $ex->getMessage(), "data" => []);
            } catch (Exception $ex) {
                $arr = array("status" => 400, "message" => $ex->getMessage(), "data" => []);
            }
        }
        return response()->json($arr);
    }

    public function change_password(Request $request)
    {
        $input = $request->all();
        $user = Auth::user();
        $rules = array(
            'old_password' => 'required',
            'new_password' => 'required|min:6',
        );

        $validator = Validator::make($input, $rules);
        if ($validator->fails()) {
            $arr = array("status" => 400, "message" => $validator->errors()->first(), "data" => array());
        } else {
            try {
                if ((Hash::check(request('old_password'), Auth::user()->password)) == false) {
                    $arr = array("status" => 400, "message" => "Check your old password.", "data" => array());
                } else if ((Hash::check(request('new_password'), Auth::user()->password)) == true) {
                    $arr = array("status" => 400, "message" => "Please enter a password which is not similar then current password.", "data" => array());
                } else {
                    User::where('id', $user->id)->update(['password' => Hash::make($input['new_password'])]);
                    $arr = array("status" => 200, "message" => "Password updated successfully.", "data" => array());
                }
            } catch (\Exception $ex) {
                if (isset($ex->errorInfo[2])) {
                    $msg = $ex->errorInfo[2];
                } else {
                    $msg = $ex->getMessage();
                }
                $arr = array("status" => 400, "message" => $msg, "data" => array());
            }
        }
        return response()->json($arr);
    }

    public function create_password(Request $request)
    {
        $input = $request->all();
        $user=User::where('email',$request->email)->first();
        User::where('id', $user->id)->update(['password' => Hash::make($input['password'])]);
        $user->firstName='gg';
        // return dd($request->password);
        //$request['password'] = Hash::make($request['password']);
        //   $user->password=$request->password;
        // $user->update([
        //     'password'=>,
         // ]);
         $user->save();
         return 'Password updated successfully, You can close your web browser';
    }
//"{{route('create_password')}}
}
