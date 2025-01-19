import 'package:flutter/material.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/list_data.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:get/get.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> listCategory = [];
  List<String> listShoesImage = ListData.getLargeDataList();
  int catItem = 0;
  @override
  void initState() {
    super.initState();
    createCategoryList();
  }

  createCategoryList() {
    listCategory.add("MEN");
    listCategory.add("WOMEN");
    listCategory.add("KIDS");
    listCategory.add("PERSONAL CARE");
    listCategory.add("HOME");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: ListView(
        children: <Widget>[
          searchHeader(),
          horizontalDivider(),
          const SizedBox(height: 14),
          recentSearchListView(),
          const SizedBox(height: 14),
          categoryList(),
          const SizedBox(height: 14),
          wishListItemListView(),
          const SizedBox(height: 14),
          viewedItemListView()
        ],
      ),
    );
  }

  horizontalDivider() {
    return Container(
      color: Colors.grey.shade200,
      height: 1,
      width: double.infinity,
    );
  }

  categoryList() {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      color: Colors.white,
      width: double.infinity,
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(maxHeight: 30, minWidth: double.infinity),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return categoryListItem(listCategory[index], index);
          },
          primary: false,
          itemCount: listCategory.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  categoryListItem(String strCategory, int index) {
    double leftMargin = 8;
    double rightMargin = 8;
    if (index == 0) {
      leftMargin = 12;
    }
    if (index == listCategory.length - 1) {
      rightMargin = 12;
    }
    return InkWell(
      onTap: () {
        setState(() {
          catItem = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            color:
                catItem == index ? ColorConst.appColor : ColorConst.whiteColor),
        child: getTxtColor(
            msg: strCategory,
            fontSize: 13,
            txtColor: catItem == index
                ? ColorConst.whiteColor
                : ColorConst.greyColor),
      ),
    );
  }

  recentSearchListView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => Get.toNamed(RoutersConst.productList),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  getTxtAppColor(msg: "Recent Searches", fontSize: 13),
                  getTxtAppColor(msg: "See All", fontSize: 13),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 100),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return recentSearchListViewItem(listShoesImage[index], index);
              },
              itemCount: listShoesImage.length,
              primary: false,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  recentSearchListViewItem(String listShoesImage, int index) {
    double leftMargin = 8;
    double rightMargin = 8;
    if (index == 0) {
      leftMargin = 16;
    }
    if (index == this.listShoesImage.length - 1) {
      rightMargin = 16;
    }
    return InkWell(
      onTap: () => Get.toNamed(RoutersConst.productDetail),
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        child: Column(
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(listShoesImage), fit: BoxFit.cover),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  shape: BoxShape.circle),
            ),
            const SizedBox(height: 4),
            const Text(
              "Search Item",
              overflow: TextOverflow.ellipsis,
              textWidthBasis: TextWidthBasis.parent,
              softWrap: true,
              textAlign: TextAlign.center,
              // style: CustomTextStyle.textFormFieldRegular
              //     .copyWith(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  wishListItemListView() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: getTxtAppColor(
                  msg: 'Items You Have Wishlisted', fontSize: 13)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return createWishListItem();
                },
                itemCount: 10,
                primary: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }

  createWishListItem() {
    return InkWell(
      onTap: () => Get.toNamed(RoutersConst.productDetail),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade100)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 70,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.teal.shade200,
                  image: const DecorationImage(
                      image: AssetImage(AssetsConst.shoes), fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: getTxtColor(
                    msg: "Highlander",
                    txtColor: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: getTxtColor(
                    msg: "\$12", txtColor: Colors.black, fontSize: 12)),
            const SizedBox(height: 6),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: <Widget>[
                  getTxtColor(
                      msg: "\$15",
                      txtColor: Colors.grey.shade400,
                      fontSize: 12),
                  const SizedBox(width: 4),
                  getTxtColor(
                      msg: "55% OFF",
                      txtColor: Colors.red.shade400,
                      fontSize: 12),
                ],
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  viewedItemListView() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: getTxtAppColor(msg: "Items You Have Viewed", fontSize: 13),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return createWishListItem();
                },
                itemCount: 10,
                primary: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}

searchHeader([IconData icons = Icons.arrow_back]) {
  return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              icons,
              color: Colors.grey.shade700,
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search for brands & products",
                  // hintStyle: CustomTextStyle.textFormFieldRegular
                  //     .copyWith(color: Colors.grey, fontSize: 12),
                  // labelStyle: CustomTextStyle.textFormFieldRegular
                  //     .copyWith(color: Colors.black, fontSize: 12),
                  border: textFieldBorder(),
                  enabledBorder: textFieldBorder(),
                  focusedBorder: textFieldBorder()),
            ),
          )
        ],
      ));
}

OutlineInputBorder textFieldBorder() => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
    borderSide: BorderSide(color: Colors.transparent));
