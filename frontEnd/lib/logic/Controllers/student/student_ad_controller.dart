import 'package:get/get.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/common model/ad_index_model.dart';
import '../../../service/model/common model/ad_view_model.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/repository/student/student_ad_repo.dart';

class StudentAdController extends GetxController {
  bool _isLoad = false;
  get isLoad=>_isLoad;
  late StudentAdRepo studentAdRepo;
  StudentAdController({required this.studentAdRepo});

late List<AdBodyModel> _productList = [];
List<AdBodyModel> get productList => _productList;
@override
@override
void onInit() {
  super.onInit();
  getAdList();
}

Future<void> getAdList() async {
  _isLoad = true;
  update();
  Response response = await studentAdRepo.getIndexList();
  print(response.statusCode);
  if (response.statusCode == 200) {
    _isLoad = false;
    _productList = [];
    _productList.addAll(AdIndexModel.fromJson(response.body).data!);
    update();
  } else {
    showCustomSnackBarRed('check internet connection', 'Error');
    _isLoad = false;
    update();
  }
}
  late AdViewModel adViewModel;
  Future<void> viewAd({required int id}) async {
    _isLoad = true;
    Response response = await studentAdRepo.showAd(IdModel(id: id));
    if (response.statusCode == 200) {
      _isLoad = false;
      adViewModel=AdViewModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoad = false;
      update();
    }
  }

}
