import 'package:flutter/material.dart';
import 'package:payment_getway/data/bean/list_profile_section.dart';
import 'package:payment_getway/utils/common/widget_helper.dart';
import 'package:payment_getway/utils/constant/api_constant.dart';
import 'package:payment_getway/view/detail/about_page.dart';
import 'package:payment_getway/view/detail/check_out_page.dart';
import 'package:payment_getway/view/detail/notification_page.dart';
import 'package:payment_getway/view/detail/order_place_page.dart';
import 'package:payment_getway/view/detail/invite_friends_page.dart';
import 'package:payment_getway/view/detail/product_detail_page.dart';
import 'package:payment_getway/view/list/see_all_product_page.dart';
import 'package:payment_getway/view/paymentgetway/paypal_payment_page.dart';
import 'package:payment_getway/view/paymentgetway/paytm_page.dart';
import 'package:payment_getway/view/paymentgetway/razorpay_page.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ListProfileSection> listSection = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection("Notifications", Icons.notifications,
        Colors.blue.shade800, NotificationPage()));
    listSection.add(createSection(
        "Check Out",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        CheckOutPage()));
    listSection.add(createSection(
        "Order Place",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        OrderPlacePage()));
    listSection.add(createSection(
        "Product Details",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        ProductDetailsPage('heroTag')));
    listSection.add(createSection(
        "See all Product",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        SeeAllProductPage()));
    listSection.add(createSection(
        "Paytm",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        PaytmPage()));
    listSection.add(createSection(
        "Razorpay Pay",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        const RazorpayPage()));
    listSection.add(createSection(
        "Paypal Payment",
        Icons.account_balance_wallet_outlined,
        Colors.teal.shade800,
        const PaypalPaymentPage()));
    listSection.add(createSection(
        "Invite Friends",
        Icons.supervised_user_circle_outlined,
        Colors.indigo.shade800,
        InviteFriendsPage()));
    listSection.add(createSection("About Us", Icons.help_outline,
        Colors.black.withOpacity(0.8), AboutPage()));
    listSection.add(createSection("Logout", Icons.login_outlined,
        Colors.red.withOpacity(0.7), Container()));
  }

  createSection(String title, IconData icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // resizeToAvoidBottomPadding: true,
      body: Builder(builder: (context) {
        return Stack(
          children: <Widget>[
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    left: -40,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: -40,
                    child: Container(
                      width: 300,
                      height: 260,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: -40,
                    child: Align(
                      child: Container(
                        width: 400,
                        height: 260,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 72, left: 24),
              child: const Text(
                "Profile",
                // style: CustomTextStyle.textFormFieldBold
                //     .copyWith(color: Colors.white, fontSize: 24),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 20,
                  child: Container(),
                ),
                Expanded(
                  flex: 75,
                  child: Stack(
                    children: <Widget>[
                      Card(
                        margin:
                            const EdgeInsets.only(top: 50, left: 16, right: 16),
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 8, top: 8, right: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.settings),
                                    iconSize: 24,
                                    color: Colors.black,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black,
                                    iconSize: 24,
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     new MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             EditProfilePage()));
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            getTxtAppColor(msg: "Deepak Sharma",fontWeight: FontWeight.bold),
                            getTxtAppColor(msg: "deepaksharma040695@gmail.com",fontWeight: FontWeight.bold),
                            const SizedBox(height: 16),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: Colors.grey.shade200,
                            ),
                            Expanded(child: buildListView())
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child:  getCacheImage(
                            url: ApiConstant.demoImg,
                            isCircle: true,
                            height: 100,
                            width: 100),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 05,
                  child: Container(),
                )
              ],
            )
          ],
        );
      }),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => listSection.widget));
        },
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 12),
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Icon(
                listSection.icon,
                color: Colors.grey.shade500,
                size: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                listSection.title,
                // style: CustomTextStyle.textFormFieldBold
                //     .copyWith(color: Colors.grey.shade500),
              ),
              const Spacer(
                flex: 1,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey.shade500,
              )
            ],
          ),
        ),
      );
    });
  }
}