import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/global_utilities.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    animation.addListener(() => setState(() {}));
    animationController.forward();
    // var userInfo = await SPManager.getCustomerId();
    delay(
        durationSec: 5,
        click: () {
          // Get.offAllNamed(RoutersConst.onboard_page);
          Get.offAllNamed(RoutersConst.home);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: animation.value * 250,
                  height: animation.value * 250, //Adapt.px(500),
                  child: Image.asset(AssetsConst.logoImg)),
              const SizedBox(height: 180),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorConst.appColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
