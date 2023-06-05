import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HomePageUi extends StatefulWidget {
  const HomePageUi({Key? key}) : super(key: key);

  @override
  _HomePageUiState createState() => _HomePageUiState();
}

class _HomePageUiState extends State<HomePageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: createUi());
  }

  createUi() {
      return SafeArea(
      child: Column(
        children: <Widget>[
          SearchWidget(),
          TopPromoSlider(),
          PopularMenu(),
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Categories',
                ),
                Tab(
                  text: 'Brands',
                ),
                Tab(
                  text: 'Shops',
                )
              ], // list of tabs
            ),
          ),
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          // Expanded(
          //   child: TabBarView(
          //     children: [
          //       Container(
          //         color: Colors.white24,
          //         child: CategoryPage(slug: 'categories/'),
          //       ),
          //       Container(
          //         color: Colors.white24,
          //         child: BrandHomePage(slug: 'brands/?limit=20&page=1'),
          //       ),
          //       Container(
          //         color: Colors.white24,
          //         child: ShopHomePage(
          //           slug: 'custom/shops/?page=1&limit=15',
          //         ),
          //       ) // class name
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              prefixIcon: Icon(Icons.search),
              fillColor: Color(0xFFF2F4F5),
              hintStyle: new TextStyle(color: Colors.grey[600]),
              hintText: "What would your like to buy?",
            ),
            autofocus: false,
          ),
          data: Theme.of(context).copyWith(
            primaryColor: Colors.grey[600],
          )),
    );
  }
}
class TopPromoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
          height: 150.0,
          width: double.infinity,
color: ColorConst.appColor,
child: Container(),
//           child: Carousel(
//             images: [
//               Image.asset(
//                 "assets/images/promotion__one.png",
//                 height: 150,
//                 width: double.infinity,
//               ),
// //              Image.asset("assets/images/promotion_two.png",height: double.infinity,width: double.infinity,),
// //              Image.asset("assets/images/promotion_three.png",height: double.infinity,width: double.infinity,),
//             ],
//             dotSize: 4.0,
//             dotSpacing: 15.0,
//             dotColor: Colors.purple,
//             indicatorBgPadding: 5.0,
//             dotBgColor: Colors.black54.withOpacity(0.2),
//             borderRadius: true,
//             radius: Radius.circular(20),
//             moveIndicatorFromBottom: 180.0,
//             noRadiusForIndicator: true,
//           )
      ),
    );
  }
}

class PopularMenu extends StatelessWidget {
  double width = 50, height = 55.0;
  double customFontSize = 13;
  String defaultFontFamily = 'Roboto-Light.ttf';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.account_balance,
                    color: Color(0xFFAB436B),
                  ),
                ),
              ),
              Text(
                "Popular",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.clock,
                    color: Color(0xFFC1A17C),
                  ),
                ),
              ),
              Text(
                "Flash Sell",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.truck,
                    color: Color(0xFF5EB699),
                  ),
                ),
              ),
              Text(
                "Evaly Store",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.gift,
                    color: Color(0xFF4D9DA7),
                  ),
                ),
              ),
              Text(
                "Voucher",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          )
        ],
      ),
    );
  }
}

// https://github.com/Tarikul711/flutter-ecommerce/blob/master/lib/components/BrandHomePage.dart
// BrandModel brandModel;
//
// class BrandHomePage extends StatefulWidget {
//   String slug;
//   bool isSubList;
//
//   BrandHomePage({Key key, this.slug, this.isSubList=false}) : super(key: key);
//   @override
//   _BrandHomePageState createState() => _BrandHomePageState();
// }
//
// class _BrandHomePageState extends State<BrandHomePage> {
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getCategoryList(widget.slug,widget.isSubList),
//       builder: (context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//           case ConnectionState.waiting:
//             return CircularProgress();
//           default:
//             if (snapshot.hasError)
//               return Text('Error: ${snapshot.error}');
//             else
//               return createListView(context, snapshot);
//         }
//       },
//     );
//   }
// }
//
// Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
//   BrandModel values = snapshot.data;
//   List<Results> results = values.results;
//   return GridView.count(
//     crossAxisCount: 3,
//     padding: EdgeInsets.all(1.0),
//     childAspectRatio: 8.0 / 9.0,
//     children: List<Widget>.generate(results.length, (index) {
//       return GridTile(
//           child: GridTilesCategory(
//               name: results[index].name,
//               imageUrl: results[index].imageUrl,
//               slug: results[index].slug));
//     }),
//   );
// }
//
// Future<BrandModel> getCategoryList(String slug, bool isSubList) async {
//   if (brandModel == null) {
//     Response response = await get(Urls.ROOT_URL + slug);
//     int statusCode = response.statusCode;
//     var body = json.decode(response.body);
//     log('${body}');
//     if (statusCode == 200) {
//       brandModel = BrandModel.fromJson(body);
// //    brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
//       return brandModel;
//     }
//   } else {
//     return brandModel;
//   }
// }
