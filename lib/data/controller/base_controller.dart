import 'package:get/get.dart';
import 'package:payment_getway/data/repo/base_repo.dart';
// import 'package:wallpaper/utils/apiutils/api_response.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  BaseRepo _baseRepo;

  BaseController(this._baseRepo);

  String employeeId = '';

  // final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

  @override
  onInit() {
    super.onInit();
  }
}
