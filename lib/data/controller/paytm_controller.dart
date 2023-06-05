import 'dart:convert';

import 'package:get/get.dart';
import 'package:payment_getway/data/bean/paytm_respo.dart';
import 'package:payment_getway/data/repo/welcome_repo.dart';
import 'package:payment_getway/utils/apiutils/api_response.dart';
import 'package:payment_getway/utils/constant/str_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';

class PaytmPaymentController extends GetxController {
  static PaytmPaymentController get to => Get.find();
  WelcomeRepo _welcomeRepo;

  PaytmPaymentController(this._welcomeRepo);

  final makePaytmRespo = (ApiResponse<PaytmRespo>()).obs;

// final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

// allCity() async {
//   allCityRespo.value = ApiResponse.loading();
//   if (employeeId.isEmpty) employeeId = await getCustomerId();
//   final data = await _homeRepo.allCity(employeeId);
//   allCityRespo.value = data;
//   // print("LoginRespo : ${callLoginRespo}");
//   return data;
// }

  makePayment(bool testing, String totalAmount) async {
    makePaytmRespo.value = ApiResponse.loading();
    Get.dialog(showLoader(), barrierDismissible: false);
    String mid = "FnAoux43246182437237";
    String PAYTM_MERCHANT_KEY = "2fCkkMtPcbf###hr";
    String website = "WEBSTAGING";
    String callBackUrl = "WEBSTAGING";
    var amount = totalAmount.toString();
    var restrictAppInvoke = true;
    String orderId = DateTime.now().millisecondsSinceEpoch.toString();
    var txnToken = await _welcomeRepo.getTxnToken(mid, PAYTM_MERCHANT_KEY,
        orderId, website, amount, restrictAppInvoke, callBackUrl, testing);

    PaytmRespo paytmRespo = await _welcomeRepo.paytmPayment(
        mid,
        PAYTM_MERCHANT_KEY,
        orderId,
        website,
        amount,
        restrictAppInvoke,
        callBackUrl,
        testing,
        txnToken);
    makePaytmRespo.value.status = ApiStatus.COMPLETED;
    makePaytmRespo.value.data = paytmRespo;
    Get.back();
    if (paytmRespo.status == "0") {
      String msg = 'Payment Cancel';
      if (paytmRespo.respmsg != null && paytmRespo.respmsg!.isNotEmpty) {
        msg = paytmRespo.respmsg!;
      }
      getSnackbar(title: StrConst.ERROR, subTitle: msg, isSuccess: false);
    } else {
      Get.back();
      // print("paytmRespo.status == 1");
      getSnackbar(
          title: StrConst.SUCCESS,
          subTitle: paytmRespo.respmsg!,
          isSuccess: true);
      // confirmPayment(orderId, req.rideType);
    }
    // Get.toNamed(RoutersConst.payment, arguments: [jsonEncode(makePaymentRespo.value.data)]);
  }
}
