import 'package:flutter/material.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/view/home/cart_page.dart';
import 'package:payment_getway/view/home/home_page.dart';
import 'package:payment_getway/view/home/profile_page.dart';
import 'package:payment_getway/view/home/search_page.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = [];

  @override
  void initState() {
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // checkForUpdate();
        return onWillPop();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPosition,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade100,
          selectedItemColor: ColorConst.appColor,
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
      ),
    );
  }

  void addHomePage() {
    listBottomWidget.add(const HomePage());
    listBottomWidget.add(SearchPage());
    listBottomWidget.add(CartPage());
    listBottomWidget.add(const ProfilePage());
  }
}