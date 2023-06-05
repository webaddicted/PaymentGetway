import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/global_utilities.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:get/get.dart';
class SeeAllProductPage extends StatefulWidget {
  @override
  _SeeAllProductPageState createState() => _SeeAllProductPageState();
}

class _SeeAllProductPageState extends State<SeeAllProductPage> {
  List<String> listImage = [];
  List<Color> listItemColor = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addImage();
    addItemColor();
  }

  void addItemColor() {
    listItemColor.add(Colors.white);
    listItemColor.add(Colors.black);
    listItemColor.add(Colors.indigo);
    listItemColor.add(Colors.teal);
    listItemColor.add(Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: filterSortListOption(),
            preferredSize: const Size(double.infinity, 44)),
        title: getTxtAppColor(msg: "GROUP BY",),
        elevation: 1,
        centerTitle: true,
        actions: const <Widget>[
         Icon(
            Icons.search,
            color: Colors.black,
            weight: 48,
         ),
          SizedBox(width: 15),
          Icon(
            Icons.shop,
            color: Colors.black,
            weight: 48,
          ),
          SizedBox(width: 15)
        ],
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            color: Colors.grey.shade100,
            margin: const EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, position) {
                return gridItem(context, position);
              },
              itemCount: listImage.length,
            ),
          );
        },
      ),
    );
  }

  filterSortListOption() {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: filterRow(Icons.filter_list, "Filter"),
            flex: 30,
          ),
          divider(),
          Expanded(
            child: filterRow(Icons.sort, "Sort"),
            flex: 30,
          ),
          divider(),
          Expanded(
            child: filterRow(Icons.list, "List"),
            flex: 30,
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: 2,
      color: Colors.grey.shade400,
      height: 20,
    );
  }

  filterRow(IconData icon, String title) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            // style: CustomTextStyle.textFormFieldBold
            //     .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
          )
        ],
      ),
    );
  }

  gridBottomView() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: const Text(
            "Chair Dacey li - Black",
            // style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 12),
            // textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "\$50.00",
              // style: CustomTextStyle.textFormFieldBold
              //     .copyWith(color: Colors.indigo.shade700, fontSize: 14),
            ),
            SizedBox(width: 8),
            Text(
              "\$80.00",
              // style: CustomTextStyle.textFormFieldBold.copyWith(
              //     color: Colors.grey,
              //     fontSize: 14,
              //     decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[

            // FlutterRatingBar(
            //   initialRating: 4,
            //   itemSize: 14,
            //   itemCount: 5,
            //   fillColor: Colors.amber,
            //   borderColor: Colors.amber.withAlpha(50),
            //   allowHalfRating: true,
            //   onRatingUpdate: (rating) {},
            // ),
            SizedBox(width: 4),
            Text(
              "4.5",
              // style: CustomTextStyle.textFormFieldMedium
              //     .copyWith(color: Colors.black, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }

  gridItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        filterBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Colors.grey.shade200)),
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 12),
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
                child: const Text(
                  "30%",
                  textAlign: TextAlign.center,
                  // style: CustomTextStyle.textFormFieldBold
                  //     .copyWith(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            Image(
              image: AssetImage(listImage[position]),
              height: 130,
              fit: BoxFit.cover,
            ),
            gridBottomView()
          ],
        ),
      ),
    );
  }

  void addImage() {
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
  }

  filterBottomSheet(BuildContext context) {
    _scaffoldKey.currentState!.showBottomSheet(
          (context) {
        return filterBottomSheetContent();
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    );
  }

  filterBottomSheetContent() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  <Widget>[
              InkWell( onTap: () => Get.back(),child: const Icon(Icons.close)),
              getTxtAppColor(msg: "Filter",fontWeight: FontWeight.w800),
              getTxt(msg: "Reset",fontWeight: FontWeight.w600),
            ],
          ),
          const SizedBox(height: 28),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child:
            getTxt(msg:"Price Range",fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 47,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Minimum",
                    // hintStyle: CustomTextStyle.textFormFieldMedium
                    //     .copyWith(color: Colors.grey.shade800),
                    focusedBorder: border,
                    contentPadding: const EdgeInsets.only(
                        right: 8, left: 8, top: 12, bottom: 12),
                    border: border,
                    enabledBorder: border,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                flex: 47,
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Maximum",
                      // hintStyle: CustomTextStyle.textFormFieldMedium
                      //     .copyWith(color: Colors.grey.shade800),
                      focusedBorder: border,
                      contentPadding: const EdgeInsets.only(
                          right: 8, left: 8, top: 12, bottom: 12),
                      border: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: getTxt(msg:"Item Filter"),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            primary: false,
            itemBuilder: (context, position) {
              return Container(
                margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  <Widget>[
                        getTxt(msg: "Discount"),
                        const Icon(
                          Icons.check,
                          color: Colors.indigo,
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            itemCount: 3,
            shrinkWrap: true,
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child:
            getTxt(msg:"Item Color",fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 30),
            child: ListView.builder(
              primary: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position) {
                return Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: listItemColor[position]),
                );
              },
              itemCount: listItemColor.length,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                Get.back();
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              color: ColorConst.appColor,
              child: getTxtBlackColor(msg: "Apply Filter",fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));
}