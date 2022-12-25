import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/AppConstants.dart';

class ApiNotification extends GetConnect implements GetxService {

  late Map<String, String> _Main_Headers;

  ApiNotification() {
    timeout = const Duration(seconds: 30);
    _Main_Headers = {
      'Content-type': 'application/json',
      'Authorization':
          'key=AAAAwjICafo:APA91bGl4kOs_x7Wl9wdFaOkcJSorNZsXdvT_durj5fG6bu21wE6r5_vvRY9tHi_NIPhdcNuD4CeIq2F_dlLzTnU-PX9qQCtLGvHbUE9_69jlvoXaIUQ1OczlEeVoFOOvB9HqBGDIZVf',
    };
  }

  Future<Response> postData(dynamic body) async {
    try {
      Response response = await post(
        'https://fcm.googleapis.com/fcm/send',
        body,
        headers: _Main_Headers,
      );
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
