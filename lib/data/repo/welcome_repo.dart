import 'dart:convert';

import 'package:payment_getway/data/bean/paytm_respo.dart';
import 'package:payment_getway/data/repo/base_repo.dart';
import 'package:payment_getway/utils/apiutils/api_base_helper.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class WelcomeRepo extends BaseRepo {

  getTxnToken(
      String mid,
      String PAYTM_MERCHANT_KEY,
      String orderId,
      String website,
      String amount,
      bool restrictAppInvoke,
      String callBackUrl,
      bool testing) async {
    var url = 'https://desolate-anchorage-29312.herokuapp.com/generateTxnToken';

    var body = json.encode({
      "mid": mid,
      "key_secret": PAYTM_MERCHANT_KEY,
      "website": website,
      "orderId": orderId,
      "amount": amount.toString(),
      "callbackUrl": callBackUrl,
      "custId": "122",
      // "mode": mode.toString(),
      "testing": testing ? 0 : 1
    });
    final response = await apiHelper.post(url: "$url", params: body);
    // print("Objectttt : $response   ${response.data}");
    // print(response.body);
    return response.data;
  }

  paytmPayment(
      String mid,
      String PAYTM_MERCHANT_KEY,
      String orderId,
      String website,
      String amount,
      bool restrictAppInvoke,
      String callBackUrl,
      bool testing,
      String txnToken) async {
    PaytmRespo payment_response = PaytmRespo();
    try {
      var response = await AllInOneSdk.startTransaction(mid, orderId,
          amount.toString(), txnToken, callBackUrl, testing, restrictAppInvoke);
      print("dtatataaa   : ${response.toString()}");
      payment_response = PaytmRespo.fromJson(response);
    } catch (err) {
      print('object $err');
      payment_response.status = ("0");
      payment_response.error = err.toString();
      payment_response.errorMsg = err.toString();
      if (err.toString().contains("Back Pressed")) {
        payment_response.error = "Payment cancel";
        payment_response.errorMsg = 'Payment cancel';
      }
    }
    return payment_response;
  }
}
