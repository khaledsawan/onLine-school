import 'package:get/get.dart';
import 'package:school/service/repository/student/student_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/student/student_profile_model.dart';
import '../../../service/model/teacher model/teacher_model.dart';
import '../../../service/repository/common repo/auth_repo.dart';
import '../../../service/repository/teacher/teacher_repo.dart';

class StudentProfileController extends GetxController implements GetxService {
  bool _isLoaded = false;
  get isLoaded => _isLoaded;
  late StudentRepo studentRepo;

  StudentProfileController({ required this.studentRepo});

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  late StudentProfileModel studentProfileModel;

  Future<void> getProfile() async {
    _isLoaded = true;
    Response response = await studentRepo.getProfile();
    if (response.statusCode == 200) {
      _isLoaded = false;
      studentProfileModel=StudentProfileModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }
}
