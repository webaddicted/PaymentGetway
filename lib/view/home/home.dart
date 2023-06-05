import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/constant/str_const.dart';
import 'package:payment_getway/utils/widget_helper.dart';
import 'package:payment_getway/view/home/cart_page.dart';
import 'package:payment_getway/view/home/home_page.dart';
import 'package:payment_getway/view/home/profile_page1.dart';
import 'package:payment_getway/view/home/search_page.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPosition,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Account"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (position) {
          setState(() {
            selectedPosition = position;
          });
        },
      ),
      body: Builder(builder: (context) {
        return listBottomWidget[selectedPosition];
      }),
    );
  }

  void addHomePage() {
    listBottomWidget.add(HomePage());
    listBottomWidget.add(SearchPage());
    listBottomWidget.add(CartPage());
    listBottomWidget.add(ProfilePage1());
  }
}


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var homeIcon = IconButton(
//         icon: const Icon(
//           Icons.arrow_back_ios,
//           color: ColorConst.WHITE_COLOR,
//         ),
//         onPressed: () => Navigator.pop(context));
//     return Scaffold(
//         appBar: getAppBarWithBackBtn(
//             title: StrConst.TITLE_HOME,
//             txtColor: ColorConst.WHITE_COLOR,
//             bgColor: ColorConst.APP_COLOR,
//             icon: homeIcon),
//         body: _createUi());
//   }
//
//   Widget _createUi() {
//     return Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//           btn(
//               txt: 'Razore Pay',
//               btnClick: () => Get.toNamed(RoutersConst.razorpay)),
//           btn(
//               txt: 'Paytm Pay',
//               btnClick: () => Get.toNamed(RoutersConst.paytm)),
//
//           // RaisedButton(onPressed: openCheckout, child: Text('Open'))
//         ]));
//   }
// }
