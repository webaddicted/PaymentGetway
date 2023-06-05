import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_getway/data/bean/paytm_respo.dart';
import 'package:payment_getway/data/controller/paytm_controller.dart';
import 'package:payment_getway/utils/apiutils/api_response.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/string_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:payment_getway/view/paymentgetway/paytm_config.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class PaytmPage extends GetView<PaytmPaymentController> {
  final PaytmPaymentController _paymentController = Get.find();

  // https://dashboard.paytm.com/next/apikeys
  // https://business.paytm.com/docs/api/initiate-transaction-api/?ref=payments
  // https://gist.github.com/red-star25/65562b056a444025f058e489c336c28a

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
            title: StringConst.titlePaytm,
            txtColor: ColorConst.whiteColor,
            bgColor: ColorConst.appColor,
            icon: homeIcon),
        body: _createUi());
  }

  Widget _createUi() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          // observeMakePaymentRespo(),
          btn(
              txt: 'Paytm Pay',
              btnClick: () {
                // PaytmConfig config = PaytmConfig();
                // config.generateTxnToken(25.5,"ORDERID_98765");
                _paymentController.makePayment(true, 30.toString());
              }),
          // RaisedButton(onPressed: openCheckout, child: Text('Open'))
        ]));
  }

  observeMakePaymentRespo() {
    return Obx(() {
      ApiResponse<PaytmRespo?> respo = _paymentController.makePaytmRespo.value;
      if (respo.status == ApiStatus.completed) {
        return Container(
          child: getTxtBlackColor(msg: "Complete"),
        );
        // data = respo.data!;
        // return data.length > 0
        //     ? getList(
        //     height: height,
        //     itemCount: data.length,
        //     widget: (context, index) => getView(
        //         index: index,
        //         height: height,
        //         width: width,
        //         onClick: () {
        //           Get.toNamed(RoutersConst.detail, arguments: [title,data[index]]);
        //         }))
        //     : noDataFound();
      } else {
        return apiHandler(response: respo);
      }
    });
  }
}
