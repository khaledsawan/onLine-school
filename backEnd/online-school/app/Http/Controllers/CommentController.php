<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Video;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Ramsey\Uuid\Type\Integer;

class CommentController extends Controller
{
    public function indexComment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role' => 'required|string',
            'base_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $comment = Comment::select(
            'users.id',
            'users.firstName',
            'users.lastName',
            'users.role',
            'comments.id',
            'comments.body',
            'comments.parent_id',
            'comments.base_id',
            'comments.created_at',
            'comments.updated_at',
        )
            ->join('users', 'users.id', 'comments.user_id')
            ->where('base_id', $request->base_id)
            ->get();
        return response()->json([
            "success" => true,
            "message" => "comment recived successfully.",
            "date" =>  $comment,
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'comment_body' => 'required|string',
            'role' => 'required|string',
            'base_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $user = Auth::user();
        $comment = new Comment;
        $comment->body = $request->get('comment_body');
        $comment->role = $request->get('role');
        $comment->base_id =  $request->get('base_id');
        $comment->user_id =  $user->id;
        $comment->save();
        if ($request->get('role') == 'video') {
            $post = Video::find($request->get('base_id'));
            $post->comments()->save($comment);
        }
        return response()->json([
            "success" => true,
            "message" => "comment",
        ]);
    }

    public function replyStore(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'comment_body' => 'required|string',
            'base_id' => 'required|numeric',
            'comment_id' => 'required|numeric',
            'role' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        if (empty(Comment::find($request->comment_id))) {
            return response()->json([
                "success" => false,
                "message" => "update your page",
            ]);
        }
        $reply = new Comment();
        $reply->body = $request->get('comment_body');
        $reply->user()->associate($request->user());
        $reply->parent_id = $request->get('comment_id');
        $reply->role = $request->get('role');
        $reply->base_id =  $request->get('base_id');
        if ($request->get('role') == 'video') {
            $post = Video::find($request->get('base_id'));
            $post->comments()->save($reply);
        }
        return response()->json([
            "success" => true,
            "message" => "comment",
        ]);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'comment_body' => 'required|string',
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $comment = Comment::find($request->id);
        $comment->body = $request->get('comment_body');
        $comment->save();
    }

    public function destroy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $comment = Comment::find($request->id);
        $comment->delete();
        $this->destroycomment($comment->id);
        return  response()->json([
            "success" => true,
            "message" => "comments deleted",
        ]);
    }

    public function destroycomment(int $id)
    {
        $comment = Comment::where('parent_id', $id)->get();
        if ($comment->isEmpty()) {
            return  response()->json([
                "success" => true,
                "message" => "comments deleted",
            ]);
        }

        foreach ($comment as $reply) {
            $reply->delete();
            $this->destroycomment($reply->id);
        }
    }
}
