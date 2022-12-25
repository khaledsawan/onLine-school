<?php

namespace App\Http\Controllers;

use App\Models\Topic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class TopicController extends Controller
{

    public function indexTopicAdmin()
    {
        $products = Topic::select('s_id')
            ->get();
        return response()->json([
            "success" => true,
            "message" => "Topic List",
            "data" => $products
        ]);
    }
    public function storeTopic(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'teacher_id' => 'required|numeric',
            'student_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $product = new Topic();
        $product->t_id = $request->teacher_id;
        $product->s_id = $request->student_id;
        $product->save();
        return response()->json([
            "success" => true,
        ]);
    }

    public function isTopic(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'teacher_id' => 'required|numeric',
            'student_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the id.",
            ]);
        }
        $data = Topic::select('id')->where('t_id', $request->teacher_id)->where('s_id', $request->student_id)->first();
        if (is_null($data)) {
            return response()->json([
                "success" => true,
                "topic_id" => -1,
            ]);
        }
        return response()->json([
            "success" => true,
            "topic_id" =>  $data->id,
        ]);
    }

    public function destroyTopic(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $product = Topic::find($request->id);
        if ($product) {
            DB::beginTransaction();
            $product->delete();
            DB::commit();
            return response()->json([
                "success" => true,
            ]);
        } else {
            return response()->json([
                "success" => true,
            ]);
        }
    }
}
