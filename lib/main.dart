import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/config/theme/color.dart';
import 'feature/aurh/login/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travela',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brandPink6D),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}

