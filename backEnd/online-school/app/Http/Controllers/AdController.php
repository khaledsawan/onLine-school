<?php

namespace App\Http\Controllers;

use App\Models\Ad;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class AdController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function indexAd()
    {
        $products = Ad::select('img','id')
            ->get();
        return response()->json([
            "success" => true,
            "message" => "Ad List",
            "data" => $products
        ]);
    }


    public function storeAd(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'description' => 'required|string',
            'img' => 'required|string',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $product = new Ad();
        $product->description = $request->description;
        $image = $request->img;
        $image = str_replace('data:image/png;base64,', '', $image);
        $image = str_replace(' ', '+', $image);
        $imageName = '/AdImages/' . date('YmdHi') . '.' . 'png';
        Storage::disk('local')->put($imageName, base64_decode($image));
        $product->img = $imageName;
        $product->save();
        return response()->json([
            "success" => true,
            "message" => "Ad created successfully.",
            "data" => $product
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ad  $ad
     * @return \Illuminate\Http\Response
     */
    public function showAd(Request $request)
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
        $product = Ad::find($request->id);
        if (is_null($product)) {
            return response()->json([
                "success" => false,
               "message" => "Product Not Find.",
            ]);
        }
        return response()->json([
            "success" => true,
            "message" => "Ad retrieved successfully.",
            "item" => $product
        ]);
    }

    public function destroyAd(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        DB::beginTransaction();
        $product = Ad::find($request->id);
        $path = substr($product->img, 10, Str::length($product->img));
            unlink(public_path() . '\\storage\\AdImages\\' . $path);
            $product ->delete();
        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "Category deleted successfully.",

        ]);
    }
}
