<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\ApiAuthController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\VideoController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\AdController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\PlayListController;
use App\Http\Controllers\VerificationController;
use App\Http\Controllers\PlayListVideoController;
use App\Http\Controllers\CommentController;


Route::post('registerStudent', [ApiAuthController::class, 'registerStudent']);
Route::post('registerAdmin', [ApiAuthController::class, 'registerAdmin']);

Route::post('ActivateEmail', [ApiAuthController::class, 'ActivateEmail']); //notify email
Route::post('create_password', [ApiAuthController::class, 'create_password'])->name('create_password');

Route::post('forgot_password', [ApiAuthController::class, 'forgot_password']);
Route::post('login', [ApiAuthController::class, 'login']);

Route::get('indexCategory', [CategoryController::class, 'indexCategory']);

Route::get('indexAd', [AdController::class, 'indexAd']);
Route::post('showAd', [AdController::class, 'showAd']);

Route::get('indexCoursesStudent', [CourseController::class, 'indexCoursesStudent']);
Route::post('searchStudent', [CourseController::class, 'searchStudent']);
Route::post('showStudent', [CourseController::class, 'showStudent']);

Route::post('showVideoStudent', [VideoController::class, 'showVideoStudent']);
Route::post('searchCourseVideosStudent', [VideoController::class, 'searchCourseVideosStudent']);


Route::get('email/verify/{id}/{hash}', [VerificationController::class, 'verify'])->name('verification.verify');
Route::get('email/resend', [VerificationController::class, 'resend'])->name('verification.resend');



Route::middleware('auth:api')->group(function () {

    Route::middleware('admin')->group(function () {
        Route::post('indexStudent', [StudentController::class, 'indexStudent']);
        Route::post('adminStudentUpdateProfile', [StudentController::class, 'adminStudentUpdateProfile']);
        Route::post('searchStudents', [StudentController::class, 'searchStudents']);
        Route::post('deleteStudent', [StudentController::class, 'deleteStudent']);
        Route::post('showStudentProfile', [StudentController::class, 'showStudentProfile']);
        Route::post('indexTeacher', [TeacherController::class, 'indexTeacher']);
        Route::post('showTeacherProfile', [TeacherController::class, 'showTeacherProfile']);
        Route::post('searchTeachers', [TeacherController::class, 'searchTeachers']);
        Route::post('updateTeacherProfile', [TeacherController::class, 'updateTeacherProfile']);
        Route::post('registerTeacher', [ApiAuthController::class, 'registerTeacher']);
        Route::post('storeCategory', [CategoryController::class, 'storeCategory']);
        Route::post('storeAd', [AdController::class, 'storeAd']);
        Route::post('destroyAd', [AdController::class, 'destroyAd']);
        Route::post('deleteCategory', [CategoryController::class, 'deleteCategory']);
        Route::post('destroyTeacher', [TeacherController::class, 'destroyTeacher']);
        Route::post('destroyAd', [AdController::class, 'destroyAd']);
    });

    Route::middleware('student')->group(function () {
        Route::name("comment")->prefix("comment")->group(function ($router) {
            Route::post('store', [CommentController::class, 'store']);
            Route::post('replyStore', [CommentController::class, 'replyStore']);
            Route::post('destroy', [CommentController::class, 'destroy']);
            Route::post('update', [CommentController::class, 'update']);
            Route::post('update', [CommentController::class, 'update']);
            Route::post('indexComment', [CommentController::class, 'indexComment']);
        });
        //video
        Route::get('indexVideo', [VideoController::class, 'indexVideo']);
        // PlayList
        Route::post('storePlayList', [PlayListController::class, 'storePlayList']);
        Route::post('destroyPlayList', [PlayListController::class, 'destroyPlayList']);
        Route::get('indexPlayList', [PlayListController::class, 'indexPlayList']);
        Route::post('showPlayListVideoQuntity', [PlayListController::class, 'showPlayListVideoQuntity']);
        Route::post('showPlayList', [PlayListController::class, 'showPlayList']);
        //PlayListVideo
        Route::post('storePlayListVideo', [PlayListVideoController::class, 'storePlayListVideo']);
        //Topic
        Route::post('storeTopic', [TopicController::class, 'storeTopic']);
        Route::post('isTopic', [TopicController::class, 'isTopic']);
        Route::post('destroyTopic', [TopicController::class, 'destroyTopic']);
        //config student
        Route::post('change_password', [ApiAuthController::class, 'change_password']);
        Route::get('getProfileStudent', [StudentController::class, 'getProfileStudent']);
        Route::post('studentUpdateProfile', [StudentController::class, 'studentUpdateProfile']);
    });
    Route::middleware('teacher')->group(function () {
        //course teacher
        Route::get('indexCoursesTeacher', [CourseController::class, 'indexCoursesTeacher']);
        Route::post('storeCourseTeacher', [CourseController::class, 'storeCourseTeacher']);
        Route::post('showTeacher', [CourseController::class, 'showTeacherCourse']);
        Route::post('updateCourseTeacher', [CourseController::class, 'updateCourseTeacher']);
        Route::post('destroyTeacherCourse', [CourseController::class, 'destroyTeacherCourse']);
        Route::post('searchTeacher', [CourseController::class, 'searchTeacher']);
        //video teacher
        Route::post('storeVideoTeacher', [VideoController::class, 'storeVideoTeacher']);
        Route::post('teacherUpdateVideo', [VideoController::class, 'teacherUpdateVideo']);
        Route::post('destroyVideoTeacher', [VideoController::class, 'destroyVideoTeacher']);
        Route::post('showVideoTeacher', [VideoController::class, 'showVideoTeacher']);
        Route::post('searchCourseVideosTeacher', [VideoController::class, 'searchCourseVideosTeacher']);
        //Route::get('indexVideo', [VideoController::class, 'indexVideo']);

        //config teacher
        Route::get('getProfile', [TeacherController::class, 'getTeacherProfile']);
    });
});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
