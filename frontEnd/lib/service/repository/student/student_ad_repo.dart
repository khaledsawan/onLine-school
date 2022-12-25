import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../utils/AppConstants.dart';
import '../../api/api_client.dart';
import '../../model/common model/id_model.dart';

class StudentAdRepo extends GetxService {
  late final ApiClient apiClient;

  StudentAdRepo({required this.apiClient});

  Future<Response> getIndexList() async {
    return await apiClient.getData(AppConstants.AD_INDEX_URL);
  }

  Future<Response> showAd(IdModel id) async {
    return await apiClient.postData(
        AppConstants.AD_VIEW_URL, id.toJson());
  }
}
