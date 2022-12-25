<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{

    public function indexCategory()
    {
        $products = Category::select('name','id')
            ->get();

        return response()->json([
            "success" => true,
            "message" => "Product List",
           "data" => $products
        ]);
    }

    public function storeCategory(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $product = new Category();
        $product->name = $request->name;
        $product->save();
        return response()->json([
            "success" => true,
            "message" => "Category Added successfully.",
            "data" => $product
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }



    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required|string',
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                "success" => false,
                "message" => "chake the fildes.",
                "data" => []
            ]);
        }
        $product = Category::where('id', '=', $request->id)->first();
            $product->name = $input['name'];
            $product->save();
        return response()->json([
            "success" => true,
            "message" => "Category updated successfully.",
            "data" => $product
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function deleteCategory(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        DB::beginTransaction();
        $product = Category::find($request->id);
        $product->delete();
        DB::commit();
        return response()->json([
            "success" => true,
            "message" => "Category deleted successfully.",
        ]);
    }
}
