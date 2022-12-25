import 'package:get/get.dart';
import 'package:school/service/repository/student/student_video_repo.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/common model/id_model.dart';
import '../../../service/model/common model/response_model.dart';
import '../../../service/model/student/student_video_model.dart';
import '../../../service/model/teacher model/teacher_search_model.dart';
import '../../../service/model/teacher model/teacher_search_video_model.dart';

class StudentVideoController extends GetxController {
  late StudentVideoRepo studentVideoRepo;
  StudentVideoController({required this.studentVideoRepo});

  bool isIntro = false;
  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  late List<SearchData> _searchList = [];
  List<SearchData> get searchList => _searchList;

  StudentViewModel videoViewModel = StudentViewModel();

  Future<ResponseModel> viewVideo({required int id}) async {
    _isLoaded = true;
    Response response = await studentVideoRepo.show(IdModel(id: id));
    print(response.statusCode);
    if (response.statusCode == 200) {
      _isLoaded = false;
      videoViewModel = StudentViewModel.fromJson(response.body);
      update();
      ResponseModel res = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: true);
      return res;
    } else {
      _isLoaded = false;
      update();
      ResponseModel res = ResponseModel(
          massage: response.statusText.toString(), isSuccessful: false);
      return res;
    }
  }

  Future<List<SearchData>> getVideoSearch({String? query, int? id}) async {
    _isLoaded = true;
    Response response = await studentVideoRepo.GetSearchStudentVideoList(
        TeacherSearchVideoModel(name: query, id: id));
    if (response.statusCode == 200) {
      _isLoaded = false;
      update();
      return TeacherSearchModel.fromJson(response.body!).data!;
    } else {
      showCustomSnackBarRed('check internet connection', 'Error');
      _isLoaded = false;
      update();
      return _searchList;
    }
  }


}
