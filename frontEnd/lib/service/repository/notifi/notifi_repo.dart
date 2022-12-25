import 'package:get/get.dart';
import 'package:school/service/api/api_client.dart';
import 'package:school/service/api/api_notification.dart';
import '../../../utils/AppConstants.dart';
import '../../model/common model/2_id_model.dart';
import '../../model/common model/id_model.dart';
import '../../model/notifi/notifi_model.dart';

class NotifiRepo extends GetxService {
  late ApiNotification apiNotification;
  late ApiClient apiClient;

  NotifiRepo({required this.apiNotification, required this.apiClient});
  Future<Response> sendNotifi(NotifiModel notifiModel) async {
    Response response = await apiNotification.postData(notifiModel.toJson());
    return response;
  }

  Future<Response> store(TowIdModel towIdModel) {
    return apiClient.postData(
        AppConstants.STORETOPIC, towIdModel.toJson());
  }

  Future<Response> destroy(IdModel id) async {
    return await apiClient.postData(
        AppConstants.DESTROYTOPIC, id.toJson());
  }

  Future<Response> isTopic(TowIdModel towIdModel) async {
    return await apiClient.postData(
        AppConstants.ISTOPIC, towIdModel.toJson());
  }
}
