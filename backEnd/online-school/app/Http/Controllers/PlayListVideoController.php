<?php

namespace App\Http\Controllers;

use App\Models\PlayListVideo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class PlayListVideoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }


    public function storePlayListVideo(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'video_id' => 'required|numeric',
            'playList_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors()->all);
        }
      
        $product = new PlayListVideo();
        $product->video_id = $request->video_id;
        $product->playList_id = $request->playList_id;
        $product->save();
        return response()->json([
            "success" => true,
            "message" => "Added successfully.",
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PlayListVideo  $playListVideo
     * @return \Illuminate\Http\Response
     */
    public function show(PlayListVideo $playListVideo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PlayListVideo  $playListVideo
     * @return \Illuminate\Http\Response
     */
    public function edit(PlayListVideo $playListVideo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlayListVideo  $playListVideo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PlayListVideo $playListVideo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PlayListVideo  $playListVideo
     * @return \Illuminate\Http\Response
     */
    public function destroy(PlayListVideo $playListVideo)
    {
        //
    }
}
