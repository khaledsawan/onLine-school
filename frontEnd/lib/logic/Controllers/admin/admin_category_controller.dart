import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/service/model/common%20model/id_model.dart';
import 'package:school/service/model/common%20model/login_model.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/admin/admin_category_model.dart';
import '../../../service/model/common model/category_index_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/repository/admin  Repo/admin_category_repo.dart';

class AdminCategoryController extends GetxController {
  late AdminCategoryRepo adminCategoryRepo;
  AdminCategoryController({required this.adminCategoryRepo});
  late TextEditingController nameController;

  late Category firstCategory;
  late List<Category> _productList = [];
  List<Category> get productList => _productList;

  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  @override
  void dispose() async {
    nameController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    getCategoryList();
    super.onInit();
  }

  Future<void> getCategoryList() async {
    _isLoaded = true;
    Response response = await adminCategoryRepo.GetProductList();
    if (response.statusCode == 200) {
      _isLoaded = false;
      _productList = [];
      _productList.addAll(CategoryIndexModel.fromJson(response.body).data!);
    if(_productList.isNotEmpty)
      firstCategory = _productList.first;
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

  saveMethod() {
    String name = nameController.text.trim();
    if (name.isEmpty) {
      showCustomSnackBarRed('enter your ad body ', 'empty field');
    } else {
      AdminAddCategoryModel addCategoryModel =
          AdminAddCategoryModel(name: name);
      storeCategory(addCategoryModel).then((status) async {
        if (status.isSuccessful!) {
          Get.back();
          getCategoryList();
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> storeCategory(
      AdminAddCategoryModel addCategoryModel) async {
    ResponseModel responseModel;
    _isLoaded = true;
    update();
    Response response = await adminCategoryRepo.store(addCategoryModel);
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      update();
    } else {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
    }
    update();
    return responseModel;
  }

  Future<void> deleteCategory(int id) async {
    _isLoaded = true;
    update();
    Response response = await adminCategoryRepo.destroy(IdModel(id: id));
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      getCategoryList();
      update();
    } else {
      _isLoaded = false;

      update();
    }
  }
}
