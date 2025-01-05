import 'package:flutter/material.dart';

import '../../../../core/widget/custom_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: const Center(child: Text("booking"),));
  }
}
