import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';
/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: ColorConst.blackColor),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: getTxtBlackColor(msg: "Address"),
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
                      showThankYouBottomSheet(context);
                    },
                    color: ColorConst.appColor,
                    textColor: Colors.white,
                    child: const Text(
                      "Place Order",
                      // style: CustomTextStyle.textFormFieldMedium.copyWith(
                      //     color: Colors.white,
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  showThankYouBottomSheet(BuildContext context) {
    return _scaffoldKey.currentState!.showBottomSheet((context) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image(
                  image: AssetImage(AssetsConst.thankYou),
                  width: 300,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(children: [
                          TextSpan(
                            text:
                            "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art devices that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out.",
                            // style: CustomTextStyle.textFormFieldMedium.copyWith(
                            //     fontSize: 14, color: Colors.grey.shade800),
                          )
                        ])),
                    const SizedBox(
                      height: 24,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      padding: const EdgeInsets.only(left: 48, right: 48),
                      color: Colors.pink,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: const Text(
                        "Track Order",
                        // style: CustomTextStyle.textFormFieldMedium
                        //     .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        backgroundColor: Colors.white,
        elevation: 2);
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
                  const Text(
                    "James Francois (Default)",
                    // style: CustomTextStyle.textFormFieldSemiBold
                    //     .copyWith(fontSize: 14),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.all(Radius.circular(16))),
                    child: const Text(
                      "HOME",
                      // style: CustomTextStyle.textFormFieldBlack.copyWith(
                      //     color: Colors.indigoAccent.shade200, fontSize: 8),
                    ),
                  )
                ],
              ),
              createAddressText(
                  "431, Commerce House, Nagindas Master, Fort", 16),
              createAddressText("Mumbai - 400023", 6),
              createAddressText("Maharashtra", 6),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      // style: CustomTextStyle.textFormFieldMedium
                      //     .copyWith(fontSize: 12, color: Colors.grey.shade800)
                        ),
                  TextSpan(
                      text: "02222673745",
                      // style: CustomTextStyle.textFormFieldBold
                      //     .copyWith(color: Colors.black, fontSize: 12)
                          ),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
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

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        // style: CustomTextStyle.textFormFieldMedium
        //     .copyWith(fontSize: 12, color: Colors.grey.shade800),
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
          child: const Text(
            "Edit / Change",
            // style: CustomTextStyle.textFormFieldSemiBold
            //     .copyWith(fontSize: 12, color: Colors.indigo.shade700),
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        Container(
          height: 20,
          width: 1,
          color: Colors.grey,
        ),
        const Spacer(
          flex: 3,
        ),
        MaterialButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Text("Add New Address",
              // style: CustomTextStyle.textFormFieldSemiBold
              //     .copyWith(fontSize: 12, color: Colors.indigo.shade700)
                ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
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
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Standard Delivery",
                // style: CustomTextStyle.textFormFieldMedium.copyWith(
                //     color: Colors.black,
                //     fontSize: 14,
                //     fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get it by 20 jul - 27 jul | Free Delivery",
                // style: CustomTextStyle.textFormFieldMedium.copyWith(
                //   color: Colors.black,
                //   fontSize: 12,
                // ),
              )
            ],
          ),
        ],
      ),
    );
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
                AssetsConst.shoes,
              ),
              width: 35,
              height: 45,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "Estimated Delivery : ",
                  // style: CustomTextStyle.textFormFieldMedium
                  //     .copyWith(fontSize: 12)
              ),
              TextSpan(
                  text: "21 Jul 2019 ",
                  // style: CustomTextStyle.textFormFieldMedium
                  //     .copyWith(fontSize: 12, fontWeight: FontWeight.w600)
                      )
            ]),
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
              const SizedBox(
                height: 4,
              ),
              const Text(
                "PRICE DETAILS",
                // style: CustomTextStyle.textFormFieldMedium.copyWith(
                //     fontSize: 12,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w600),
              ),
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
                  const Text(
                    "Total",
                    // style: CustomTextStyle.textFormFieldSemiBold
                    //     .copyWith(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    getFormattedCurrency(2013),
                    // style: CustomTextStyle.textFormFieldMedium
                    //     .copyWith(color: Colors.black, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getFormattedCurrency(double amount) {
    // FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: amount,
    //     settings: MoneyFormatterSettings(
    //     symbol: '₹',
    //     thousandSeparator: ',',
    //     decimalSeparator: '.',
    //     symbolAndNumberSeparator: ' ',
    //     fractionDigits: 3,
    //     compactFormatType: CompactFormatType.short
    // ));
    // fmf.symbol = "₹";
    // fmf.thousandSeparator = ",";
    // fmf.decimalSeparator = ".";
    // fmf.spaceBetweenSymbolAndNumber = true;
    return amount.toString();
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            // style: CustomTextStyle.textFormFieldMedium
            //     .copyWith(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            // style: CustomTextStyle.textFormFieldMedium
            //     .copyWith(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
}