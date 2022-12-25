<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Verified;
use Illuminate\Foundation\Auth\VerifiesEmails;
use Illuminate\Auth\Access\AuthorizationException;

class VerificationController extends Controller
{

    // public function __construct()
    // {
    //     $this->middleware('auth:api')->only('resend');
    //     $this->middleware('signed')->only('verify');
    //     $this->middleware('throttle:6,1')->only('verify', 'resend');
    // }

    public function resend(Request $request)
    {
        if ($request->user()->hasVerifiedEmail()) {

            return response(['message'=>'Already verified']);
        }

        $request->user()->sendEmailVerificationNotification();

        if ($request->wantsJson()) {
            return response(['message' => 'Email Sent']);
        }

        return back()->with('resent', true);
    }

    public function verify(Request $request)
    {
        auth()->loginUsingId($request->route('id'));

        if ($request->route('id') != $request->user()->getKey()) {
            throw new AuthorizationException;
        }

        if ($request->user()->hasVerifiedEmail()) {

            return response(['message'=>'Already verified']);

            // return redirect($this->redirectPath());
        }

        if ($request->user()->markEmailAsVerified()) {
            event(new Verified($request->user()));
        }

        return response(['message'=>'Successfully verified']);

    }

}
