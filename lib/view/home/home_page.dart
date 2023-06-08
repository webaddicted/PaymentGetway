import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:get/get.dart';
import 'package:payment_getway/view/home/search_page.dart';
/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listImage = [];
  List<String> listShoesImage = [];
  int selectedSliderPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderImage();
    shoesImage();
  }

  void sliderImage() {
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
  }

  void shoesImage() {
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
    listShoesImage.add(AssetsConst.shoes);
  }
  ScrollController controller =  ScrollController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return Scrollbar(
            controller: controller,
            thumbVisibility: true,
            thickness: kIsWeb?25:0,
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        color: ColorConst.appColor,
                        height: height / 4,
                      ),
                      /*Search Section*/
                      Container(
                          margin:
                              const EdgeInsets.only(top: 48, right: 24, left: 24),
                          child: searchHeader(Icons.search),
                          ),
                      /*Slider Section*/
                      Container(
                          height: kIsWeb ?(height / 2.2) + 75:(height / 4) + 75,
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: kIsWeb ?height/2.5:height / 5,
                            child: PageView.builder(
                              itemBuilder: (context, position) {
                                return createSlider(listImage[position]);
                              },
                              controller: PageController(viewportFraction: .8),
                              itemCount: listImage.length,
                              onPageChanged: (position) {
                                /*setState(() {
                                selectedSliderPosition = position;
                              });*/
                              },
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: ()=>Get.toNamed(RoutersConst.productList),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: getTxtAppColor(
                                msg: "GROUP BY",
                                fontSize: 15,
                                fontWeight: FontWeight.w700)),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              getTxtAppColor(
                                  msg: "SEE ALL",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                              const Icon(Icons.arrow_forward),
                              const SizedBox(width: 16),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  /*Group By Product Listing*/
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return createGroupBuyListItem(
                            listShoesImage[index], index);
                      },
                      itemCount: listShoesImage.length,
                    ),
                  ),

                  /*Most Big Product Listing*/
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16),
                          child: getTxtAppColor(
                              msg: "MOST BIG",
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            getTxtAppColor(
                                msg: "SEE ALL",
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                            const Icon(Icons.arrow_forward),
                            const SizedBox(width: 16),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 230),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return createMostBigListItem(
                            listShoesImage[index], index, context);
                      },
                      itemCount: listShoesImage.length,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  createSlider(String image) {
    return InkWell(
      onTap: ()=>{
      Get.toNamed(RoutersConst.productDetail)
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
      ),
    );
  }

  createGroupBuyListItem(String image, int index) {
    double leftMargin = 0;
    double rightMargin = 0;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return InkWell(
      onTap: ()=>Get.toNamed(RoutersConst.productDetail),
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 75,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                        fit: BoxFit.cover
                    ),
                    color: Colors.blue.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    getTxtAppColor(
                        msg: "NIKE Kyire II",
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                    const SizedBox(height: 4),
                    getTxtColor(
                        msg: "Exquisite you need him",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        txtColor: Colors.black.withOpacity(.7)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  createMostBigListItem(String image, int index, BuildContext context) {
    // double leftMargin = 0;
    // double rightMargin = 0;
    // double radius = 16;
    // if (index != listShoesImage.length - 1) {
    //   leftMargin = 10;
    // } else {
    //   leftMargin = 10;
    //   rightMargin = 10;
    // }
    return InkWell(
      onTap: ()=>Get.toNamed(RoutersConst.productDetail),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: <Widget>[
            Hero(
              tag: "$image,$index",
              transitionOnUserGestures: true,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                        fit: BoxFit.cover
                    ),
                    color: Colors.teal.shade200,
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(radius),
                    //     topRight: Radius.circular(radius))
                      ),
              ),
            ),
            const SizedBox(height: 8),
            getTxtColor(
                msg: "Exquisite you need him",
                fontSize: 15,
                fontWeight: FontWeight.w700,
                txtColor: Colors.black.withOpacity(.7)),
            const SizedBox(height: 4),
            getTxtColor(
                msg: "NIKE Kyire II",
                fontSize: 12,
                fontWeight: FontWeight.w700,
                txtColor: Colors.black.withOpacity(.7)),
          ],
        ),
      ),
    );
  }
}
