import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/string_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  String heroTag;

  ProductDetailsPage(this.heroTag);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState(heroTag);
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin<ProductDetailsPage> {
  List<Color> listColor = [];
  List<String> listSize = [];
  int selectedColor = -1;

  var selectedSize = -1;

  var heroTag;

  _ProductDetailsPageState(this.heroTag);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addColor();
    addSize();
  }

  void addColor() {
    listColor.add(Colors.red);
    listColor.add(Colors.green);
    listColor.add(Colors.yellow);
    listColor.add(Colors.black);
    listColor.add(Colors.teal);
    listColor.add(Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    var halfOfScreen = MediaQuery.of(context).size.height / 1.5;
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: false,
      body: Builder(builder: (context) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Hero(
                  tag: heroTag,
                  child: const Image(
                    image: AssetImage(AssetsConst.shoes),
                    height: 360,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: ()=>{Get.back()},
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        height: 28,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400,
                        ),
                        child:
                           const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                             size: 28,
                          ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 4,
                            width: 4,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                          Container(
                            height: 28,
                            width: 32,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     new MaterialPageRoute(
                                //         builder: (context) => CartPage()));
                              },
                              iconSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: productDetailsSection(),
              )
            ],
          ),
        );
      }),
    );
  }

  productDetailsSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 300),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: getTxtAppColor(msg: "NIKE XTM Basketball Shoes",fontWeight: FontWeight.w500),
                      ),
                      IconButton(icon: const Icon(Icons.close), onPressed: () {})
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Colour",
                      textAlign: TextAlign.start,
                      // style: CustomTextStyle.textFormFieldBold
                      //     .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 40),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return createColorItem(index);
                      },
                      itemCount: listColor.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 8),
                    child: const Text(
                      "Size",
                      // style: CustomTextStyle.textFormFieldMedium
                      //     .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 40),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return createSizeItem(index);
                      },
                      itemCount: listSize.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text(
                          "Total",
                          // style: CustomTextStyle.textFormFieldMedium
                          //     .copyWith(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: const Text(
                          "\$299.00",
                          // style: CustomTextStyle.textFormFieldBlack.copyWith(
                          //     color: Colors.greenAccent.shade700, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  getTxt(msg: StringConst.dummyTxt, fontWeight: FontWeight.w500),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {},
                    height: 40,
                    color: ColorConst.appColor,
                    padding: const EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: getTxtWhiteColor(msg: "Add To Cart"),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  Container createSizeItem(int index) {
    return Container(
      width: 28,
      margin: const EdgeInsets.all(4),
      height: 28,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: selectedSize == index ? Colors.blue : Colors.grey,
              width: 1),
          shape: BoxShape.circle),
      child: Text(
        listSize[index],
        // style: CustomTextStyle.textFormFieldSemiBold
        //     .copyWith(fontSize: 12, color: Colors.black.withOpacity(0.8)),
        textAlign: TextAlign.center,
      ),
    );
  }

  GestureDetector createColorItem(int index) {
    return GestureDetector(
      child: Container(
        width: 24,
        margin: const EdgeInsets.all(4),
        height: 24,
        decoration: BoxDecoration(
            color: listColor[index],
            border: Border.all(
                color: Colors.grey, width: selectedColor == index ? 2 : 0),
            shape: BoxShape.circle),
      ),
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
    );
  }

  void addSize() {
    listSize.add("4");
    listSize.add("5");
    listSize.add("6");
    listSize.add("7");
    listSize.add("8");
    listSize.add("9");
    listSize.add("10");
  }
}
