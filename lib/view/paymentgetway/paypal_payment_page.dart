import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/str_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:payment_getway/view/paypal/paypal_payment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted
class PaypalPaymentPage extends StatefulWidget {
  const PaypalPaymentPage({Key? key}) : super(key: key);

  @override
  _PaypalPaymentPageState createState() => _PaypalPaymentPageState();
}

class _PaypalPaymentPageState extends State<PaypalPaymentPage> {

  @override
  Widget build(BuildContext context) {
    var homeIcon = IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ColorConst.WHITE_COLOR,
        ),
        onPressed: () => Navigator.pop(context));
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          title: StrConst.TITLE_PAYPAL_PAYMENT,
          txtColor: ColorConst.WHITE_COLOR,
          bgColor: ColorConst.APP_COLOR,
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
            btn(txt: 'Paypal Payment Getway', btnClick: openCheckout)
            // RaisedButton(onPressed: openCheckout, child: Text('Open'))
          ])),
    );
  }

  @override
  void initState() {
    super.initState();
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
  }

  void openCheckout() async {
    try {
      _handlePaymentSuccess();
      PaypalPayment(
          onFinish: (number) async {
            // payment done
            final snackBar = SnackBar(
              content: const Text("Payment done Successfully"),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess() {
    Fluttertoast.showToast(
        msg: "SUCCESS: ",
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
