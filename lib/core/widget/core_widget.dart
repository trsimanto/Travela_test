import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/theme/color.dart';
import '../utils/Image_keys.dart';

commonText(String text,
    {Color color = Colors.white,
      double size = 12,
      FontWeight fontWeight = FontWeight.normal,
      int? maxLine = null}) =>
    Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
      maxLines: maxLine,
    );

profileImageErrorAndPlaceHolder({double w = 50, Color color = Colors.white}) =>
    Container(
      width: w,
      height: w,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );

greenToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 14.0);
}

redToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0);
}

Widget bigButton(Function buttonTap, {bool isLoading = false}) =>
    GestureDetector(
      onTap: () {
        buttonTap.call();
      },
      child: Container(
        height: 56,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 56 - 18,
              width: 56 - 18,
              // padding: EdgeInsets.all(4),
              child:
              Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
Widget logo({double height = 100}) {
  return Image.asset(
    getImage(TrImageEnumsKeys.topLogo),
    width: double.infinity,
  );
}

Widget searchButton()=> InkWell(
    onTap: () {
      // Handle button press
      print("Search Button Pressed");
    },
    borderRadius: BorderRadius.circular(30),
    child: Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      height: 56,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Shadow color
            blurRadius: 10, // Shadow blur
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            getSvg(
              TrImageEnumsKeys.search,
            ),
            colorFilter:
            ColorFilter.mode(AppColors.black19, BlendMode.srcIn),
            width: 28,
            height: 28,
          ),
          // Search Icon
          Text(
            "Search",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black19,
            ),
          ),
          SizedBox(width: 24,)
        ],
      ),
    ));
