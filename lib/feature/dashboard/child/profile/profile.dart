import 'package:flutter/material.dart';

import '../../../../core/widget/custom_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: const Center(child: Text("Profile"),));
  }
}
