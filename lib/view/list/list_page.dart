import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/global_utilities.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> listImage = [];
  List<Color> listItemColor = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedColor = 0;
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
  ScrollController controller =  ScrollController();
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
        actions: <Widget>[
         InkWell(
           onTap: ()=>Get.toNamed(RoutersConst.search),
           child: const Icon(
              Icons.search,
              color: Colors.black,
              weight: 48,
           ),
         ),
          const SizedBox(width: 15),
          InkWell(
            onTap: ()=>Get.toNamed(RoutersConst.cart),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              weight: 48,
            ),
          ),
          const SizedBox(width: 15)
        ],
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Builder(
        builder: (context) {
          return Scrollbar(
            controller: controller,
            thumbVisibility: true,
            thickness: 25,
            child: Container(
              color: Colors.grey.shade100,
              margin: const EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
              child: GridView.builder(
                controller: controller,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: kIsWeb?5:3),
                itemBuilder: (context, position) {
                  return gridItem(context, position);
                },
                itemCount: listImage.length,
              ),
            ),
          );
        },
      ),
    );
  }

  filterSortListOption() {
    return InkWell(
      onTap: ()=> filterBottomSheet(Get.context),
      child: Container(
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
              child: filterRow(Icons.list_alt_outlined, "Sort"),
              flex: 30,
            ),
            divider(),
            Expanded(
              child: filterRow(Icons.border_all_outlined, "List"),
              flex: 30,
            ),
          ],
        ),
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
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 6),
          getTxtAppColor(msg: "Chair Dacey li - Black",fontWeight: FontWeight.w600, fontSize: 13),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTxtGreyColor(msg: "\$80.00",fontWeight: FontWeight.w600, fontSize: 13),
              const SizedBox(width: 2),
              getTxtBlackColor(msg: "\$50.00",fontWeight: FontWeight.w600, fontSize: 13),
            ],
          ),
          const SizedBox(height: 6),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              // FlutterRatingBar(
              //   initialRating: 4,
              //   itemSize: 14,
              //   itemCount: 5,
              //   fillColor: Colors.amber,
              //   borderColor: Colors.amber.withAlpha(50),
              //   allowHalfRating: true,
              //   onRatingUpdate: (rating) {},
              // ),
              const SizedBox(width: 4),
              getTxtAppColor(msg: "4.5",fontWeight: FontWeight.w600, fontSize: 13),
            ],
          )
        ],
      ),
    );
  }

  gridItem(BuildContext context, int position) {
    return InkWell(
      onTap: () {
       Get.toNamed(RoutersConst.productDetail);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Colors.grey.shade200)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image(
                  image: AssetImage(listImage[position]),
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: ColorConst.appColor),
                    child: getTxtWhiteColor(msg: "30%",
                        textAlign: TextAlign.center,fontSize: 12),
                  ),
                ),
              ],
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
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
    listImage.add(AssetsConst.shoes);
  }

  filterBottomSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return filterBottomSheetContent();
        });
  }

  filterBottomSheetContent() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
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
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return createColorItem(index);
                },
                itemCount: listItemColor.length,
                primary: false,
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
                child: getTxtWhiteColor(msg: "Apply Filter",fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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
              color: listItemColor[index],
              border: Border.all(
                  color:  selectedColor == index?ColorConst.appColor:Colors.grey, width: selectedColor == index ? 3 : 0),
              shape: BoxShape.circle),
        )
    );
  }

  var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));
}