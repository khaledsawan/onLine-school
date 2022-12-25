import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:school/service/model/common%20model/id_model.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/admin/admin_add_ad_model.dart';
import '../../model/teacher model/teacher_add_list_model.dart';

class AdminAdRepo extends GetxService {
  late final ApiClient apiClient;

  AdminAdRepo({required this.apiClient});

Future<Response> GetProductList() async {
  return await apiClient.getData(AppConstants.AD_INDEX_URL);
}
//
//   Future<Response> getMyProductList() async {
//     return await apiClient.getData(AppConstants.STUDENTHOUSEINDEX);
//   }

  Future<Response> storeAd(
      AdminAddAdModel adminAddAdModel) {
    return apiClient.postData(
        AppConstants.AD_ADD_URL, adminAddAdModel.toJson());
  }
  Future<Response> deleteAd(
      IdModel id) {
    return apiClient.postData(
        AppConstants.AD_DELETE_URL, id.toJson());
  }

// Future<Response> destroy(ProductId productDestroy) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_DESTROY, productDestroy.toJson());
// }
//
Future<Response> showAd(IdModel id) async {
  return await apiClient.postData(
      AppConstants.AD_VIEW_URL, id.toJson());
}
//
// Future<Response> update(UpdateProductModel updateProductModel) async {
//   return await apiClient.postData(
//       AppConstants.PRODUCT_URL_UPDATE, updateProductModel.toJson());
// }
}
