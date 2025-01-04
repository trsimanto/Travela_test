
import 'package:flutter/material.dart';
import '../config/theme/color.dart';
import 'core_widget.dart';

t14(String title) => commonText(title, size: 14);





/*editText(String hint, ValueChanged<String> text,
        {bool obscure = false,
        TextInputType keyboardType = TextInputType.text,
        TextInputAction textInputAction = TextInputAction.next,
        controller,
        IconData? leadingIcon}) =>
    EditText(
      hint: hint,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscure: obscure,
      controller: controller,
      onTextChanged: text,
      leadingIcon: leadingIcon,
    );*/

class CustomScaffold extends Scaffold {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  CustomScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.drawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
  }) : super(
            key: key,
            backgroundColor: AppColors.whiteFF,
            appBar: appBar,
            body: body,
            drawer: drawer,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar);
}

sH2() => SizedBox(height: 2);

sH4() => SizedBox(height: 4);

sH8() => SizedBox(height: 8);

sH16() => SizedBox(height: 16);

sH32() => SizedBox(height: 32);

sH64() => SizedBox(height: 64);

sH100() => SizedBox(height: 100);

sW2() => SizedBox(width: 2);

sW4() => SizedBox(width: 4);

sW8() => SizedBox(width: 8);

sW16() => SizedBox(width: 16);

sW32() => SizedBox(width: 32);

sW64() => SizedBox(width: 64);
