import 'package:flutter/material.dart';

import '../../../../core/widget/custom_widget.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: const Center(child: Text("Inbox"),));
  }
}