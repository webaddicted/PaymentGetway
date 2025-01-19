import 'dart:core';
import 'package:flutter/material.dart';
import 'package:payment_getway/view/paypal/paypal_service.dart';

class PaypalPayment extends StatefulWidget {
  final Function? onFinish;

  const PaypalPayment({Key? key, this.onFinish}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? checkoutUrl;
  String? executeUrl;
  String? accessToken;
  PaypalServices services = PaypalServices();

  // you can change default value according to your desired
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
        await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (ex) {
        final snackBar = SnackBar(
          content: Text(ex.toString()),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  // item name, price and quantity
  String itemName = 'One plus 10';
  String itemPrice = '100';
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name": itemName,
        "quantity": quantity,
        "price": itemPrice,
        "currency": defaultCurrency["currency"]
      }
    ];

    // checkout invoice details
    String totalAmount = '100';
    String subTotalAmount = '100';
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = 'john';
    String userLastName = 'smith';
    String addressCity = 'USA';
    String addressStreet = "i-10";
    String addressZipCode = '44000';
    String addressCountry = 'Pakistan';
    String addressState = 'Islamabad';
    String addressPhoneNumber = '+1 223 6161 789';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping && isEnableAddress)
              "shipping_address": {
                "recipient_name": userFirstName + " " + userLastName,
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: Container()
        // WebView(
        //   initialUrl: checkoutUrl,
        //   javascriptMode: JavascriptMode.unrestricted,
        //   navigationDelegate: (NavigationRequest request) {
        //     if (request.url.contains(returnURL)) {
        //       final uri = Uri.parse(request.url);
        //       final payerID = uri.queryParameters['PayerID'];
        //       if (payerID != null) {
        //         services
        //             .executePayment(executeUrl, payerID, accessToken)
        //             .then((id) {
        //           widget.onFinish!(id);
        //           Navigator.of(context).pop();
        //         });
        //       } else {
        //         Navigator.of(context).pop();
        //       }
        //       Navigator.of(context).pop();
        //     }
        //     if (request.url.contains(cancelURL)) {
        //       Navigator.of(context).pop();
        //     }
        //     return NavigationDecision.navigate;
        //   },
        // ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
  }
}