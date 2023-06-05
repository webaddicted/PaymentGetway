import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class PaytmConfig {
  final String _mid = "FnAoux43246182437237";
  final String _mKey = "2fCkkMtPcbf###hr";
  final String _website = "DEFAULT";
  final String _url =
      'https://flutter-paytm-backend.herokuapp.com/generateTxnToken';
  // var url = 'https://desolate-anchorage-29312.herokuapp.com/generateTxnToken';
  String get mid => _mid;
  String get mKey => _mKey;
  String get website => _website;
  String get url => _url;

  String getMap(double amount, String callbackUrl, String orderId) {
    return json.encode({
      "mid": mid,
      "key_secret": mKey,
      "website": website,
      "orderId": orderId,
      "amount": amount.toString(),
      "callbackUrl": callbackUrl,
      "custId": "122",
    });
  }

  Future<void> generateTxnToken(double amount, String orderId) async {
    final callBackUrl =
        'https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=$orderId';
    // String callBackUrl = (testing
    //     ? 'https://securegw-stage.paytm.in'
    //     : 'https://securegw.paytm.in') +
    //     '/theia/paytmCallback?ORDER_ID=' +
    //     orderId;
    final body = getMap(amount, callBackUrl, orderId);

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-type': "application/json"},
      );
      String txnToken = response.body;

      await initiateTransaction(orderId, amount, txnToken, callBackUrl);
    } catch (e) {
      print(e);
    }
  }

  Future<void> initiateTransaction(String orderId, double amount,
      String txnToken, String callBackUrl) async {
    String result = '';
    try {
      var response = AllInOneSdk.startTransaction(
        mid,
        orderId,
        amount.toString(),
        txnToken,
        callBackUrl,
        false,
        false,
      );
      response.then((value) {
        // Transaction successfull
        print(value);
      }).catchError((onError) {
        if (onError is PlatformException) {
          result = onError.message! + " \n  " + onError.details.toString();
          print(result);
        } else {
          result = onError.toString();
          print(result);
        }
      });
    } catch (err) {
      // Transaction failed
      result = err.toString();
      print(result);
    }
  }
}
