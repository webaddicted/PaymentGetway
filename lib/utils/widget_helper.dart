import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payment_getway/utils/apiutils/api_response.dart';
import 'package:payment_getway/utils/constant/assets_const.dart';
import 'package:payment_getway/utils/constant/color_const.dart';
import 'package:payment_getway/utils/constant/str_const.dart';

//  {START TEXT VIEW}
Text getTxt(
    {required String msg,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(msg,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontWeight: fontWeight));
}

Text getTxtAppColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.APP_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtWhiteColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.WHITE_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtBlackColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.BLACK_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtGreyColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.GREY_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtColor(
    {required String msg,
    required Color txtColor,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: txtColor, fontSize: fontSize, fontWeight: fontWeight),
  );
}

TextStyle _getFontStyle(
    {required Color txtColor,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = AssetsConst.ZILLASLAB_FONT,
    TextDecoration txtDecoration = TextDecoration.none}) {
  return TextStyle(
      color: txtColor,
      fontSize: fontSize,
      decoration: txtDecoration,
      fontFamily: fontFamily,
      fontWeight: fontWeight);
}

//  {END TEXT VIEW}

Widget edtPwdField(
    {required TextEditingController control,
    bool pwdVisible = false,
    bool isRect = true,
    IconData icons = Icons.lock_outline,
    Function? pwdVisibleClick}) {
  return TextFormField(
    controller: control,
    decoration: InputDecoration(
      counterText: '',
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      border: OutlineInputBorder(
          borderRadius:
              isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
      hintText: "Password",
      prefixIcon: Icon(icons),
      suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            pwdVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () => pwdVisibleClick),
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
    ),
    obscureText: !pwdVisible,
    textInputAction: TextInputAction.done,
    maxLength: 32,
    // validator: ValidationHelper.validateNormalPass,
  );
}

Widget edtDobField(
    {required TextEditingController control,
    bool isRect = true,
    validate,
    IconData? icons,
    Color iconColor = Colors.grey,
    String title = '',
    Function? click}) {
  return TextFormField(
    onTap: () => click,
    validator: validate,
    decoration: InputDecoration(
      counterText: '',
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      border: OutlineInputBorder(
          borderRadius:
              isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
      hintText: title,
      prefixIcon: Icon(
        icons,
        color: iconColor,
      ),
      hintStyle:
          const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    readOnly: true,
    controller: control,
    // validator: (dob) => ValidationHelper.empty(dob, 'DOB is Required'),
  );
}

Widget edtRectField(
    {TextEditingController? control,
    required String hint ,
    validate,
    IconData? icons,
    bool isRect = true,
    int txtLength = 32,
    keyboardType,
    bool isReadOnly = false,
    int maxLine = 1,
    double contentVerticalPadding = 5,
    double contentHoriPadding = 5,
    textCapitalization = TextCapitalization.words}) {
  return TextFormField(
      textCapitalization: textCapitalization,
      //TextCapitalization.words,
      controller: control,
      textInputAction: TextInputAction.next,
      maxLength: txtLength,
      validator: validate,
      keyboardType: keyboardType,
      maxLines: maxLine,
      //TextInputType.number,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
            horizontal: contentHoriPadding, vertical: contentVerticalPadding),
        border: OutlineInputBorder(
            borderRadius:
                isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
        hintText: hint,
        prefixIcon: Icon(icons),
        labelText: hint,
        hintStyle:
            const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
      ));
}

Widget edtDateField(Function dateClick,
    {String date = '',
    String title = '',
    Color titleColor = ColorConst.BLACK_COLOR,
    Color? bgColor}) {
  return Expanded(
    child: InkWell(
      onTap: () => dateClick,
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 8, top: 5),
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getTxtColor(
              msg: title,
              txtColor: titleColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 5),
            getTxtBlackColor(msg: date)
          ],
        ),
      ),
    ),
  );
}

Widget btn(
        {required String txt,
        Color color = ColorConst.LIGHT_GREEN_COLOR,
        double height = 45,
        double width = double.infinity,
        bool isRoundBtn = false,
        double borderRadius = 0,
        required Function btnClick}) =>
    ButtonTheme(
      minWidth: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => btnClick(),
        clipBehavior: Clip.antiAlias,
        child: getTxtWhiteColor(
            msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
      ),
    );

AppBar getAppBar({required String title, double fontSize = 15}) {
  return AppBar(
      centerTitle: true,
      title: getTxtBlackColor(
          msg: title, fontWeight: FontWeight.bold, fontSize: fontSize));
}

AppBar getAppBarWithBackBtn(
    {String title = '',
    Color bgColor = ColorConst.WHITE_COLOR,
    Color txtColor = ColorConst.BLACK_COLOR,
    double fontSize = 15,
    String titleTag = '',
    Widget? icon,
    List<Widget>? actions}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: icon,
    actions: actions,
    centerTitle: true,
    title: Hero(
        tag: titleTag,
        child: getTxtColor(
            msg: title,
            txtColor: txtColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold)),
  );
}

Divider getDivider() {
  return const Divider(
    color: ColorConst.GREY_COLOR,
    height: 1,
  );
}

onWillPop() async {
  Widget widget = AlertDialog(
    content: getTxtColor(
        msg: StrConst.are_you_sure_exit,
        fontSize: 17,
        txtColor: ColorConst.BLACK_COLOR),
    title: getTxtBlackColor(
        msg: StrConst.warning, fontSize: 18, fontWeight: FontWeight.bold),
    actions: <Widget>[
      MaterialButton(
          child: getTxtBlackColor(msg: StrConst.yes, fontSize: 17),
          onPressed: () async {
            // Get.offAllNamed(RoutersConst.home);
          }),
      MaterialButton(
          child: getTxtBlackColor(msg: StrConst.no),
          onPressed: () => Get.back()),
    ],
  );
  Get.dialog(widget);
}

showCustomDialog() => showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 150,
            width: 130,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 20,
                  ),
                  getTxtBlackColor(
                      msg: "Loading...",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ),
          ));
    });

Widget showError(String? error) {
  return Visibility(
      visible: (error != null && error.isNotEmpty) ? false : true,
      child: getTxtColor(msg: error ?? '', txtColor: ColorConst.RED_COLOR));
}

showSnackbar(
    {String title = '', String subTitle = '', bool isSuccess = false}) {
  Get.snackbar(title, subTitle,
      backgroundColor:
          isSuccess ? ColorConst.GREEN_COLOR : ColorConst.RED_COLOR,
      colorText: ColorConst.WHITE_COLOR,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3));
}

Widget showLoader({bool isShowDialog = false}) {
  var content = const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(ColorConst.WHITE_COLOR),
    ),
  );
  return isShowDialog
      ? AlertDialog(
          scrollable: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: content)
      : content;
}

Widget getList({
  required double height,
  required int itemCount,
  Axis scrollDirection = Axis.vertical,
  ScrollPhysics? physics,
  required Function widget,
}) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      // physics: BouncingScrollPhysics(),
      physics: physics ?? const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) => widget(context, index),
    ),
  );
}

Widget getGrid({
  // required double height,
  required int itemCount,
  int crossAxisCount = 2,
  double childAspectRatio = (1.5 / 1.8),
  ScrollPhysics? physics,
  required Function widget,
}) {
  return GridView.builder(
    itemCount: itemCount,
    shrinkWrap: true,
    physics: physics ?? const BouncingScrollPhysics(),
    // physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
    ),
    itemBuilder: (context, index) => widget(context, index),
  );
}

getSnackbar(
    {required String title, required String subTitle, bool isSuccess = true}) {
  Get.snackbar(title, subTitle,
      backgroundColor:
          isSuccess ? ColorConst.GREEN_COLOR : ColorConst.RED_COLOR,
      colorText: ColorConst.WHITE_COLOR,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3));
}

Widget apiHandler<T>(
    {required ApiResponse<T> response, Widget? loading, Widget? error}) {
  if (response.status == null) {
    return Container();
  } else {
    switch (response.status) {
      case ApiStatus.LOADING:
        return loading ??
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorConst.APP_COLOR),
              ),
            );
      case ApiStatus.ERROR:
        return Center(
          child: getTxtColor(
              msg: response.apiError!.errorMessage.toString(),
              txtColor: ColorConst.RED_COLOR),
        );
      // return error != null ? error : showError(response.apierror.errorMessage);
      default:
        {
          return Container(
            color: Colors.amber,
            child: getTxtAppColor(msg: StrConst.SOMETHING_WENT_WRONG),
          );
        }
    }
  }
}

Widget noDataFound() {
  return Center(
    child: Container(
      width: 250,
      height: 250,
      child: Image.asset(
        AssetsConst.NO_DATA_FOUND,
        width: Get.width,
      ),
    ),
  );
}
