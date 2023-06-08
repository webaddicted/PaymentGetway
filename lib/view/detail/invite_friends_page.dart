import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/global_utilities.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:get/get.dart';
/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class InviteFriendsPage extends StatefulWidget {
  @override
  State<InviteFriendsPage>  createState() => _InviteFriendsPageState();
}

class _InviteFriendsPageState extends State<InviteFriendsPage> {
  static const platform = MethodChannel('flutter.native/helper');
  String shareResponse = "Sharing";

  Future<String> shareApp() async {
    String response = "";
    try {
      String result = await platform.invokeMethod("shareApp");
      printLog(msg: "METHOD : $result");
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to shared app $e";
    }
    setState(() {
      shareResponse = response;
    });
    return shareResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorConst.blackColor),
            onPressed: () => Get.back()
            ),
        title: getTxtBlackColor(msg: "Address", fontWeight: FontWeight.w600),
        centerTitle: true,
        backgroundColor: ColorConst.whiteColor,
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                flex: 90,
                child: ListView(
                  children: <Widget>[createHeader(), createMiddle()],
                ),
              ),
              createFooter(context)
            ],
          );
        },
      ),
    );
  }

  Expanded createFooter(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 85,
            child: Container(
              margin: const EdgeInsets.only(left: 4, right: 4, bottom: 8, top: 6),
              child: MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 16),
                onPressed: () {
                  shareApp();
                },
                color: ColorConst.appColor,
                child: getTxtWhiteColor(
                  msg : "Share Link",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              margin: const EdgeInsets.only(right: 4, bottom: 8, top: 6),
              child: MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 14),
                onPressed: () {},
                color: ColorConst.appColor,
                child: const Icon(Icons.qr_code_2, color: ColorConst.whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  createHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160,
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsConst.refer),
                    fit: BoxFit.cover)),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: getTxt(
                msg: "Invite Friends & Earn Points", fontWeight: FontWeight.w600)),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: getTxt(
                msg: "When you invite friends to join Carter, you can 100 points to each friends.Whenever your friends consume through Carter, you will get a 5% bonus",
              ))
        ],
      ),
    );
  }

  createMiddle() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                getTxtAppColor(msg: "My Invitation", fontWeight: FontWeight.w500),
                getTxtAppColor(msg: "Details"),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            height: 1,
            width: double.infinity,
          ),
          SizedBox(
            height: 60,
            child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return gridItem();
              },
              itemCount: 2,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }

  gridItem() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 8,
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: 8),
          const Icon(
            Icons.menu,
            color: Colors.blue,
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTxtAppColor(msg: "0.34123205"),
              const SizedBox(width: 4),
              getTxtAppColor(msg: "Today Reward")
            ],
          ),
        ],
      ),
    );
  }
}