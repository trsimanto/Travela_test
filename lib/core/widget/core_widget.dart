import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

Widget bigButton(Function onTap, {bool isLoading = false}) =>
    GestureDetector(
      onTap: () {
        // Handle continue action
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
