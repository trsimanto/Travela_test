import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:travela/feature/dashboard/page/dashboard.dart';

import '../../../../core/widget/core_widget.dart';
import '../../../../core/widget/custom_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Column(
        children: [
          logo(),
          sH16(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text: "Travela",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Insert your phone number to continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pink, width: 2),
                      ),
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  const Spacer(),
                  bigButton(() {
                    Get.offAll(DashboardScreen());
                  }),
                  sH16(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
