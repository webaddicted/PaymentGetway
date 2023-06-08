import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted


import 'package:flutter/material.dart';

class OrderPlaceSuccessPage extends StatefulWidget {
  @override
  _OrderPlaceSuccessPageState createState() => _OrderPlaceSuccessPageState();
}

class _OrderPlaceSuccessPageState extends State<OrderPlaceSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage(AssetsConst.thankYou),
                    width: 300,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(children: [
                          TextSpan(
                            text:
                            "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art devices that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out.",
                            // style: CustomTextStyle.textFormFieldMedium
                            //     .copyWith(fontSize: 12, color: Colors.grey),
                          )
                        ])),
                    const SizedBox(height: 24),
                    MaterialButton(
                      onPressed: () {},
                      color: ColorConst.appColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(24))),
                      child: getTxtBlackColor(msg: "View Order"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}