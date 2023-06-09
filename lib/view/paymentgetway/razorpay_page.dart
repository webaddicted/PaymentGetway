import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/string_const.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted
class RazorpayPage extends StatefulWidget {
  const RazorpayPage({Key? key}) : super(key: key);

  @override
  _RazorpayPageState createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {
  // static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    var homeIcon = IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ColorConst.whiteColor,
        ),
        onPressed: () => Navigator.pop(context));
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          title: StringConst.titleRazorpay,
          txtColor: ColorConst.whiteColor,
          bgColor: ColorConst.appColor,
          actions: [
            Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
                _renderCounterBadge(8)
              ],
            )
          ],
          icon: homeIcon),
      body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            btn(txt: 'Razore Pay', btnClick: openCheckout)
            // RaisedButton(onPressed: openCheckout, child: Text('Open'))
          ])),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Widget _renderCounterBadge(int totalItems) {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Text(
          '$totalItems',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 20000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
