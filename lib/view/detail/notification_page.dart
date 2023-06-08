import 'package:flutter/material.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:get/get.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorConst.blackColor),
            onPressed: () => Get.back()
        ),
        title: getTxtBlackColor(msg: "Address", fontWeight: FontWeight.w600),
        centerTitle: true,
        backgroundColor: ColorConst.whiteColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return createNotificationListItem(index);
        },
        itemCount: getDummyList().length,
      ),
    );
  }

  /*createItem(){
    return ListTile(
      title: Text(
        "Payment Complete",
        style: CustomTextStyle.textFormFieldBlack
            .copyWith(color: Colors.black, fontSize: 16),
      ),
      isThreeLine: true,
      trailing: IconButton(icon: Icon(Icons.close), onPressed: () {}),
      subtitle: Text(
        "Thank you for your recent payment. Your monthly subscription has been activated until June 2020.",
        softWrap: true,
        style: CustomTextStyle.textFormFieldMedium
            .copyWith(color: Colors.grey,fontSize: 14),
      ),
    );
  }*/

  createNotificationListItem(int index) {
    return Dismissible(
      key: const Key("key_1"),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        getDummyList().removeAt(index);
      },
      background: Container(
        color: Colors.green,
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(width: 16)
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 02,
              child: Container(
                width: 4,
                margin: const EdgeInsets.only(right: 4),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              flex: 98,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        "Payment Complete",
                        // style: CustomTextStyle.textFormFieldBlack
                        //     .copyWith(color: Colors.black, fontSize: 16),
                      ),
                      IconButton(icon: const Icon(Icons.close), onPressed: () {})
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    child: const Text(
                      "Thank you for your recent payment. Your monthly subscription has been activated until June 2020.",
                      softWrap: true,
                      textAlign: TextAlign.start,
                      // style: CustomTextStyle.textFormFieldMedium
                      //     .copyWith(color: Colors.grey, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}