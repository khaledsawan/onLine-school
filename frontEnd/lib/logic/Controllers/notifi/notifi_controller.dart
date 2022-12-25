import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:school/service/model/common%20model/2_id_model.dart';
import 'package:school/service/model/notifi/notifi_model.dart';
import 'package:school/service/repository/notifi/notifi_repo.dart';
import 'package:school/utils/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../component/Custom_snackpar/show_custom_snackpar_green.dart';
import '../../../firebase_options.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/notifi/is_topic_model.dart';
import '../student/student_profile_controller.dart';

class NotifiController extends GetxController {
  bool _isLoading = false;
  get isLoading => _isLoading;
  late SharedPreferences prefs;
  late NotifiRepo notifiRepo;
  late int studentId=Get.find<StudentProfileController>().studentProfileModel.user!.id!;
  late FirebaseMessaging massage;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;
  bool isFlutterLocalNotificationsInitialized = false;
  IdModel idTopic = IdModel();
  late List<String> detail = [];

  NotifiController({required this.notifiRepo, required this.massage,required this.prefs});


  @override
  void onInit() {
    if(prefs.containsKey(AppConstants.NOTIFICATION_LIST)) {
      detail.addAll(prefs.getStringList(AppConstants.NOTIFICATION_LIST)!);
    }
    super.onInit();
  }

  bool isSus() {
    if (topicModel.topicId == -1) {
      return true;
    } else {
      return false;
    }
  }
  void addToList(String item){
    detail.add(item);
    update();
  }
  void deleteFromList(int index){
    detail.removeAt(index);
    prefs.setStringList(AppConstants.NOTIFICATION_LIST,detail);
    update();
  }

  IsTopicModel topicModel = IsTopicModel();
  Future<void> isTopic(
      {required int teacherId, required int studentId}) async {

    update();
    Response response = await notifiRepo
        .isTopic(TowIdModel(teacherId: teacherId, studentId: studentId));

    if (response.statusCode == 200) {

      topicModel = IsTopicModel.fromJson(response.body);
      if(topicModel.topicId!=-1){
        await FirebaseMessaging.instance.subscribeToTopic(teacherId.toString());
      }
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');

      update();
    }
  }
  Future<void> susTopic(
      {required int teacherId}) async {

    update();
    Response response = await notifiRepo
        .store(TowIdModel(teacherId: teacherId, studentId: studentId));

    if (response.statusCode == 200) {

      await FirebaseMessaging.instance.subscribeToTopic(teacherId.toString());
      showCustomSnackParGreen('you will receive notification', '!');
     await  isTopic(teacherId: teacherId,
          studentId: studentId);

      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');

      update();
    }
  }
  Future<void> unTopic(int teacherID) async {
 //   _isLoading = true;

    Response response =
        await notifiRepo.destroy(IdModel(id: topicModel.topicId));

    if (response.statusCode == 200) {
     // _isLoading = false;
      await FirebaseMessaging.instance.unsubscribeFromTopic(teacherID.toString());
      await isTopic(teacherId:teacherID,
          studentId: studentId);

    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
    //  _isLoading = false;

    }
  }

  Future<ResponseModel> sendNotifi(NotifiModel notifiModel) async {
    ResponseModel responseModel;
    update();
    Response response = await notifiRepo.sendNotifi(notifiModel);
    if (response.statusCode == 200) {
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      update();
    } else {
      update();
      responseModel = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      update();
    }
    update();
    return responseModel;
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await setupFlutterNotifications();
    showFlutterNotification(message);

  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

}
