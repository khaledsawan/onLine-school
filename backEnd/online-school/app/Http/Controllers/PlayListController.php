<?php

namespace App\Http\Controllers;

use App\Models\PlayList;
use App\Models\PlayListVideo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class PlayListController extends Controller
{
    public function indexPlayList()
    {
        $user = Auth::user();

        $products = PlayList::select('name', 'id')
            ->where('student_id', $user->id)
            ->get();

        return response()->json([
            "success" => true,
            "PlayList" => $products
        ]);
    }

    public function storePlayList(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
        $user = Auth::user();
        $product = new PlayList();
        $product->name = $request->name;
        $product->student_id = $user->id;

        $product->save();
        return response()->json([
            "success" => true,
            "message" => "Course Added successfully.",
            "data" => $product
        ]);
    }

    public function showPlayListVideoQuntity(Request $request)
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
        $videoplayList = PlayListVideo::select()
            ->join('videos', 'videos.id', 'play_list_videos.video_id')
            ->where('play_list_videos.playList_id', $request->id)
            ->count();

        return response()->json([
            "success" => true,
            "message" => "PlayList retrieved successfully.",
            "videoplayList" => $videoplayList
        ]);
    }
    public function showPlayList(Request $request)
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
        $product = PlayList::find($request->id);
        if (is_null($product)) {
            return response()->json([
                "success" => false,
                "message" => "PlayList Not Find.",
            ]);
        }
        $videoplayList = PlayListVideo::select(
            'play_list_videos.video_id',
            'videos.img as videoImage',
            'videos.name as videoName'
        )
            ->join('videos', 'videos.id', 'play_list_videos.video_id')
            ->where('play_list_videos.playList_id', $request->id)
            ->orderBy('videos.id')
            ->get();

        return response()->json([
            "success" => true,
            "PlayList" =>  $product,
            "videoplayList" => $videoplayList
        ]);
    }

    public function destroyPlayList(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        DB::beginTransaction();
        PlayListVideo::where('playList_id', $request->id)->delete();
        $product = PlayList::find($request->id);
        $product->delete();
        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "playlist deleted successfully.",
        ]);
    }
}
