import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/constant/string_const.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:get/get.dart';
import 'package:payment_getway/utils/theme/text_style.dart';
/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class AddressPage extends StatefulWidget {
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _radioValue = 0.obs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: ColorConst.blackColor),
              onPressed: () {
                Get.back();
              }),
          title: getTxtBlackColor(msg: "Address", fontWeight: FontWeight.w600),
          centerTitle: true,
          backgroundColor: ColorConst.whiteColor,
        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                flex: 90,
                child: ListView(
                  children: <Widget>[
                    selectedAddressSection(),
                    standardDelivery(),
                    checkoutItem(),
                    priceSection()
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: MaterialButton(
                    onPressed: () {
                      /*Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => OrderPlacePage()));*/
                      // showThankYouBottomSheet(context);
                      _payBottomSheet(Get.context);
                    },
                    color: ColorConst.appColor,
                    textColor: Colors.white,
                    child: getTxtWhiteColor(msg: "Place Order",fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  selectedAddressSection() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  getTxtBlackColor(msg: "Deepak Sharma (Default)", fontWeight: FontWeight.w600),
                  Container(
                    padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: ColorConst.appColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: getTxtWhiteColor(msg: "HOME"),
                  )
                ],
              ),
              createAddressText("Apex Circle, Usha Colony, Malviya Nagar", 16),
              createAddressText("Jaipur - 302017", 6),
              createAddressText("Rajasthan", 6),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Mobile : ",
                    style: AppTextStyle.normalBlack12.copyWith(fontSize: 13, fontWeight: FontWeight.w600)
                  ),
                  TextSpan(
                      text: "+91-9024061407",
                      style: AppTextStyle.normalBlack12.copyWith(fontSize: 13, color: Colors.grey.shade800)
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
              addressAction()
            ],
          ),
        ),
      ),
    );
  }

  addressAction() {
    return Row(
      children: <Widget>[
        const Spacer(
          flex: 2,
        ),
        MaterialButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: getTxtBlackColor(msg: "Edit / Change", fontWeight: FontWeight.w600),
        ),
        const Spacer(flex: 3),
        Container(
          height: 20,
          width: 1,
          color: Colors.grey,
        ),
        const Spacer(flex: 3),
        MaterialButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: getTxtBlackColor(msg: "Add New Address", fontWeight: FontWeight.w600),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: getTxtBlackColor(msg: strAddress),
    );
  }

  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border:
          Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
          color: Colors.tealAccent.withOpacity(0.2)),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: ColorConst.appColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getTxtBlackColor(msg:"Standard Delivery",fontWeight: FontWeight.w600),
              const SizedBox(height: 5),
              getTxtBlackColor(msg: "Get it by 20 jul - 27 jul | Free Delivery")
            ],
          ),
        ],
      ),
    );
  }

  void _payBottomSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              color: Colors.transparent,
              child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Obx(() {
                    var value = _radioValue.value;
                    // getTxtAppColor(
                    //     msg:
                    //     '${_settingController.walletAmountRespo.value.data.walletAmount ?? ""}',
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.w800);
                    return Wrap(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 15),
                            Center(
                              child: getTxtAppColor(
                                  msg: "Select Payment Mode",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20),
                            // showRadio("Paytm", 0, false),
                            // showRadio("COD", 1, false),
                            showRadio("Paytm", 0),
                            showRadio("Razorpay", 1),
                            showRadio("Paypal", 2),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTxtBlackColor(
                                    msg: 'Total Price : ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                getTxtGreyColor(
                                    msg:
                                    '${StringConst.rupeeSymbol} 299',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.end),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTxtAppColor(
                                    msg: 'Discount : ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                getTxtAppColor(
                                    msg:
                                    '- ${StringConst.rupeeSymbol} 100',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.end),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTxtColor(
                                    msg: 'Pay : ',
                                    fontSize: 16,
                                    txtColor: ColorConst.redColor,
                                    fontWeight: FontWeight.w600),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                      getTxtColor(
                                          msg:
                                          '${StringConst.rupeeSymbol} 199',
                                          fontSize: 17,
                                          txtColor: ColorConst.redColor,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.end),
                                    getTxtBlackColor(
                                        msg: '(include all tax)',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.end),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 3),
                            ElevatedButton(
                                onPressed: () {
                                  // Get.back();
                                  if(_radioValue.value==0){
                                    Get.toNamed(RoutersConst.paytm);
                                  }else  if(_radioValue.value==1){
                                    Get.toNamed(RoutersConst.razorpay);
                                  }else  if(_radioValue.value==2){
                                    Get.toNamed(RoutersConst.paypalPayment);
                                  }
                                },
                                clipBehavior: Clip.antiAlias,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        left: 60,
                                        right: 60,
                                        top: 10,
                                        bottom: 10),
                                    backgroundColor: ColorConst.appColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20))),
                                child: getTxtWhiteColor(
                                    msg: 'Pay',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    );
                  })));
        });
  }

  Widget showRadio(String title, int value) {
    return Row(children: [
      Radio(
        value: value,
        groupValue: _radioValue.value,
        onChanged: _handleRadioValueChange,activeColor: ColorConst.appColor,
      ),
      getTxtBlackColor(msg: title, fontSize: 15, fontWeight: FontWeight.w500),
    ]);
  }

  void _handleRadioValueChange(int? value) {
    _radioValue.value = value!;
  }

  checkoutItem() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return checkoutListItem();
            },
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }

  checkoutListItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Container(
            decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
            child: const Image(
              image: AssetImage(
                AssetsConst.shoes
              ),
              width: 70,
              height: 45,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTxtBlackColor(msg: "NIKE XTM Basketball Shoes",fontWeight: FontWeight.w500),
              RichText(
                text:  TextSpan(children: [
                  TextSpan(
                      text: "Estimated Delivery : ",
                      style: AppTextStyle.normalBlack12.copyWith(fontWeight: FontWeight.w500)
                  ),
                  TextSpan(
                      text: "21 Jul 2023 ",
                      style: AppTextStyle.normalBlack12.copyWith(fontWeight: FontWeight.w500)
                          )
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  priceSection() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 4),
              getTxtBlackColor(msg: "PRICE DETAILS",fontWeight: FontWeight.w600),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              createPriceItem("Total MRP", getFormattedCurrency(5197),
                  Colors.grey.shade700),
              createPriceItem("Bag discount", getFormattedCurrency(3280),
                  Colors.teal.shade300),
              createPriceItem(
                  "Tax", getFormattedCurrency(96), Colors.grey.shade700),
              createPriceItem("Order Total", getFormattedCurrency(2013),
                  Colors.grey.shade700),
              createPriceItem(
                  "Delievery Charges", "FREE", Colors.teal.shade300),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   getTxtBlackColor(msg: "Total",fontWeight: FontWeight.w600),
                  getTxtBlackColor(msg: "${StringConst.rupeeSymbol} 2013",fontWeight: FontWeight.w600),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getFormattedCurrency(double amount) {
    return amount.toString();
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
          Text(value)
        ],
      ),
    );
  }
}