import 'package:get/get.dart';
import 'package:payment_getway/data/controller/base_controller.dart';
import 'package:payment_getway/data/controller/paytm_controller.dart';
import 'package:payment_getway/data/repo/base_repo.dart';
import 'package:payment_getway/data/repo/welcome_repo.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(BaseRepo()), fenix: true);
    Get.lazyPut(() => PaytmPaymentController(WelcomeRepo()), fenix: true);
  }
}
