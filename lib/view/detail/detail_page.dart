import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/constant/string_const.dart';
import 'package:payment_getway/utils/global_utilities.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:get/get.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class DetailPage extends StatefulWidget {
  String heroTag;

  DetailPage(this.heroTag);

  @override
  State<DetailPage> createState() => _DetailPageState(heroTag);
}

class _DetailPageState extends State<DetailPage>
    with TickerProviderStateMixin<DetailPage> {
  List<Color> listColor = [];
  List<String> listSize = [];
  int selectedColor = 0;

  var selectedSize = 0;

  var heroTag;

  _DetailPageState(this.heroTag);

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
              InkWell(
                onTap: ()=>{
                  printLog(msg:"back click"),
                  Get.back()},
                child: Hero(
                    tag: heroTag,
                    child: const Image(
                      image: AssetImage(AssetsConst.shoes),
                      height: 360,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: ()=>{
                        printLog(msg:"back click"),
                        Get.back()},
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConst.whiteColor,
                        ),
                        child:
                           const Icon(
                            Icons.arrow_back,
                            color: ColorConst.blackColor,
                             size: 20,
                          ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConst.whiteColor),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: ColorConst.blackColor,
                              ),
                              alignment: Alignment.center,
                              onPressed: () {
                              Get.toNamed(RoutersConst.cart);
                                // Navigator.of(context).push(
                                //     new MaterialPageRoute(
                                //         builder: (context) => CartPage()));
                              },
                              iconSize: 20,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
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
  ScrollController controller =  ScrollController();
  productDetailsSection() {
    return Scrollbar(
controller: controller,
      thickness: 25,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: controller,
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
                      onPressed: () {
                        Get.toNamed(RoutersConst.cart);
                      },
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
      ),
    );
  }

  InkWell createSizeItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedSize = index;
        });
      },
      child: Container(
        width: 28,
        margin: const EdgeInsets.all(4),
        height: 28,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: selectedSize == index ? ColorConst.appColor : Colors.grey,
                width: selectedSize == index ? 3:1),
            shape: BoxShape.circle),
        child: Container(
            alignment: Alignment.center,
            child: getTxtBlackColor(msg: listSize[index],fontWeight: FontWeight.w600, textAlign: TextAlign.center, fontSize: 13)),
      ),
    );
  }

  InkWell createColorItem(int index) {
    return InkWell(
        onTap: () {
          setState(() {
            selectedColor = index;
          });
        },
      child: Container(
        width: 24,
        margin: const EdgeInsets.all(4),
        height: 24,
        decoration: BoxDecoration(
            color: listColor[index],
            border: Border.all(
                color: selectedColor == index ?ColorConst.appColor: Colors.grey, width: selectedColor == index ? 3 : 0),
            shape: BoxShape.circle),
      )
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
