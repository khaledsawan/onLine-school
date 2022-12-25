import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/name_model.dart';
import '../../../service/model/student/student_index_playList_model.dart';
import '../../../service/model/student/student_list_view_model.dart';
import '../../../service/repository/student/student_playList_repo.dart';
import '../../../service/repository/student/tow_id_model.dart';

class StudentListViewController extends GetxController implements GetxService {
  bool _isLoading = false;
  get isLoad => _isLoading;
  late StudentPlayListRepo playListRepo;
  late SharedPreferences prefs;
  late TextEditingController titleController;
  late StudentIndexPlayListModel studentIndexPlayListModel;
  late StudentListViewModel studentListViewModel;
  List<int> _selectedItems = <int>[];
  get selectedItems=>_selectedItems;
  StudentListViewController({required this.prefs, required this.playListRepo});


removeItem(index){
  _selectedItems.removeWhere((val) => val == index);
  update();
}
  addItem(index){
    _selectedItems.add(index);
    update();
  }
  @override
  void dispose() async {
    titleController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    getMyPlayList();
    super.onInit();
  }

  Future<void> getMyPlayList() async {
    _isLoading = true;
    update();
    Response response = await playListRepo.getMyPlayList();
    print(response.statusCode );
    if (response.statusCode == 200) {
      _isLoading = false;
      studentIndexPlayListModel =
          StudentIndexPlayListModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoading = false;
      update();
    }
  }

  Future<void> viewPlayList(int id) async {
    _isLoading = true;
    update();
    IdModel idModel = IdModel(id: id);
    Response response = await playListRepo.viewListView(idModel);
    print(response.statusCode );
    if (response.statusCode == 200) {
      _isLoading = false;
      studentListViewModel = StudentListViewModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoading = false;
      update();
    }
  }

  Future<void> createListFunction() async {
    _isLoading = true;
    update();
    String title = titleController.text;
    if (title.isNotEmpty) {
      NameModel nameModel = NameModel(name: title);
      Response response = await playListRepo.createListView(nameModel);
      print(response.statusCode );
      if (response.statusCode == 200) {
        Get.back();
        getMyPlayList();
      } else {
        showCustomSnackBarRed('check internet connection', 'error');
      }
      _isLoading = false;
      update();
    } else {
      showCustomSnackBarRed('empty filed', 'error');
    }
  }

  Future<void> addVideoToList(int video_id,int list_view_id) async {
    print('secend');
    _isLoading = true;
    update();

      TowIDModel towIDModel = TowIDModel(playList_id: list_view_id,video_id: video_id);
      Response response = await playListRepo.addVideoToList(towIDModel);
      print('response.statusCode add video to list : ' );
      print(response.statusCode );
      if (response.statusCode == 200) {
        _isLoading = false;
        update();
      } else {
        showCustomSnackBarRed('check internet connection', 'error');
        _isLoading = false;
        update();
      }
  }
  Future<void> deleteListFunction(int id) async {
    _isLoading = true;
    update();

    IdModel idModel = IdModel(id: id);
    Response response = await playListRepo.deleteListView(idModel);
    print(response.statusCode );
    if (response.statusCode == 200) {
      studentIndexPlayListModel.playList!
          .removeWhere((element) => element.id == id);
      _isLoading = false;
      update();
      Get.back();
    } else {
      showCustomSnackBarRed('check internet connection', 'error');

      _isLoading = false;
      update();
    }


  }

  addVideoToListFunction(int videoId) async{
  print('start');
    _selectedItems.forEach((element) async {
     await addVideoToList(videoId,element);
    });
    Get.back();
    _selectedItems=[];
  }
}
