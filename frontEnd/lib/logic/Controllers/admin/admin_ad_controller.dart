import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:school/service/model/common%20model/id_model.dart';
import 'package:school/service/model/common%20model/login_model.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/admin/admin_add_ad_model.dart';
import '../../../service/model/common model/ad_index_model.dart';
import '../../../service/model/common model/ad_view_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/repository/admin  Repo/admin_ad_repo.dart';
import 'dart:io';

class AdminAdController extends GetxController {
  late AdminAdRepo adminAdRepo;
  AdminAdController({required this.adminAdRepo});
  late TextEditingController nameController;

  late AdIndexModel adIndexModel;
  late AdViewModel adViewModel;

  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  late String imageName = '';
  late String imageUrl = '1';
  late File file;
  late PickedFile? image;
  late Uint8List? uint8list; //for web

  @override
  void dispose() async {
    nameController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    getAdsList();
    super.onInit();
  }


  gallery() async {
    final imagePicker = ImagePicker();
    image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image!.path);
      imageName = basename(image!.path);
      Get.back();
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }

  camera() async {
    final imagePicker = ImagePicker();
    PickedFile? image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      imageName = basename(image.path);
      Get.back();
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }

  clearImage() {
    imageName = '';
    imageUrl = '1';
    file.delete();
    update();
  }


  Future<void> getAdsList() async {
    _isLoaded = true;
    Response response = await adminAdRepo.GetProductList();
    if (response.statusCode == 200) {
      _isLoaded = false;
      adIndexModel =AdIndexModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }

  Future<void> viewAd({required int id})async {
    _isLoaded = true;
    Response response = await adminAdRepo.showAd(IdModel(id: id));
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      adViewModel =AdViewModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }
  Future<void> deleteAd({required int id})async {
    _isLoaded = true;
    Response response = await adminAdRepo.deleteAd(IdModel(id: id));
   print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      adViewModel =AdViewModel.fromJson(response.body);
      getAdsList();
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
    } else if (imageName == '') {
      showCustomSnackBarRed('Add image ', 'empty image');
    } else {
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      AdminAddAdModel adminAddAdModel = AdminAddAdModel(img:base64Image,description:name);
          storeAdd(adminAddAdModel)
          .then((status) async {
        if (status.isSuccessful!) {
          getAdsList();
          Get.offNamed(AppRoutes.adminmainpage);
        } else {
          showCustomSnackBarRed('${status.massage}', 'error');
        }
      });
    }
  }

  Future<ResponseModel> storeAdd(
      AdminAddAdModel adminAddAdModel) async {
    ResponseModel responseModel;
    _isLoaded = true;
    update();
    Response response = await adminAdRepo.storeAd(adminAddAdModel);
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

}
