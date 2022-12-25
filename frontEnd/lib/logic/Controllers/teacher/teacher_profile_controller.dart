import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/teacher model/teacher_model.dart';
import '../../../service/repository/common repo/auth_repo.dart';
import '../../../service/repository/teacher/teacher_repo.dart';

class TeacherProfileController extends GetxController implements GetxService {
  bool _isLoaded = false;
  get isLoaded => _isLoaded;
  late TeacherRepo teacherRepo;

  TeacherProfileController({ required this.teacherRepo});

  late TeacherModel teacherModel;
  Future<void> getProfile() async {
    _isLoaded = true;
    Response response = await teacherRepo.getProfile();
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      teacherModel=TeacherModel.fromJson(response.body);
      update();
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
    }
  }
}
