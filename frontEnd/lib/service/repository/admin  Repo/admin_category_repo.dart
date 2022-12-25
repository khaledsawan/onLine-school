import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:school/service/model/common%20model/id_model.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/admin/admin_add_ad_model.dart';
import '../../model/admin/admin_category_model.dart';
import '../../model/teacher model/teacher_add_list_model.dart';

class AdminCategoryRepo extends GetxService {
  late final ApiClient apiClient;

  AdminCategoryRepo({required this.apiClient});

  Future<Response> GetProductList() async {
    return await apiClient.getData(AppConstants.CATEGORY_INDEX_URL);
  }
//
//   Future<Response> getMyProductList() async {
//     return await apiClient.getData(AppConstants.STUDENTHOUSEINDEX);
//   }

  Future<Response> store(
      AdminAddCategoryModel addCategoryModel) {
    return apiClient.postData(
        AppConstants.CATEGORY_ADD_URL, addCategoryModel.toJson());
  }

Future<Response> destroy(IdModel id) async {
  return await apiClient.postData(
      AppConstants.CATEGORY_DELETE_URL, id.toJson());
}
//
// Future<Response> show(ProductId view_id) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_SHOW, view_id.toJson());
// }
//
// Future<Response> update(UpdateProductModel updateProductModel) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_UPDATE, updateProductModel.toJson());
// }
}
