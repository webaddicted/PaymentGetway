import 'package:get/route_manager.dart';
import 'package:payment_getway/view/detail/about_page.dart';
import 'package:payment_getway/view/detail/check_out_page.dart';
import 'package:payment_getway/view/detail/invite_friends_page.dart';
import 'package:payment_getway/view/detail/notification_page.dart';
import 'package:payment_getway/view/detail/order_place_success_page.dart';
import 'package:payment_getway/view/detail/detail_page.dart';
import 'package:payment_getway/view/home/cart_page.dart';
import 'package:payment_getway/view/home/home.dart';
import 'package:payment_getway/view/home/profile_page.dart';
import 'package:payment_getway/view/home/search_page.dart';
import 'package:payment_getway/view/list/list_page.dart';
import 'package:payment_getway/view/paymentgetway/paypal_payment_page.dart';
import 'package:payment_getway/view/paymentgetway/paytm_page.dart';
import 'package:payment_getway/view/paymentgetway/razorpay_page.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/view/splash_page.dart';

RoutesPage() => [
  GetPage(name: RoutersConst.initialRoute, page: () => SplashPage()),
  GetPage(name: RoutersConst.home, page: () => Home()),
  GetPage(name: RoutersConst.search, page: () => SearchPage()),
  GetPage(name: RoutersConst.cart, page: () => CartPage()),
  GetPage(name: RoutersConst.profile, page: () => ProfilePage()),
  GetPage(name: RoutersConst.productDetail, page: () => DetailPage("")),
  GetPage(name: RoutersConst.productList, page: () => ListPage()),
  GetPage(name: RoutersConst.notification, page: () => NotificationPage()),
  GetPage(name: RoutersConst.checkOut, page: () => CheckOutPage()),
  GetPage(name: RoutersConst.orderPlaceSuccess, page: () => OrderPlaceSuccessPage()),
  GetPage(name: RoutersConst.inviteFriend, page: () => InviteFriendsPage()),
  GetPage(name: RoutersConst.aboutUs, page: () => AboutPage()),

  GetPage(name: RoutersConst.razorpay, page: () => const RazorpayPage()),
  GetPage(name: RoutersConst.paytm, page: () => PaytmPage()),
  GetPage(name: RoutersConst.paypalPayment, page: () => PaypalPaymentPage()),

  // GetPage(name: RoutersConst.onboard_page, page: () => OnboardingPage()),
  // GetPage(name: RoutersConst.welcome_page, page: () => SplashPage()),
  // GetPage(name: RoutersConst.interest_page, page: () => InterestedPage()),
  // GetPage(name: RoutersConst.get_start, page: () => GetStartPage()),

  // GetPage(name: RoutersConst.list, page: () => ListPage()),
  // GetPage(name: RoutersConst.detail, page: () => DetailPage()),
  // GetPage(name: RoutersConst.profile, page: () => ProfilePage()),
  // GetPage(name: RoutersConst.fullimage, page: () => FullImagePage()),
  // GetPage(name: RoutersConst.preview, page: () => PreviewPage()),


  // GetPage(name: RoutersConst.login, page: () => LoginPage()),
  // GetPage(name: "products/:id", page: () => Product()),
  // GetPage(name: "/cart", page: () => Cart()),
];