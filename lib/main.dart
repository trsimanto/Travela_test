import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travela/core/config/theme/color.dart';
import 'package:travela/feature/aurh/login/view/login.dart';
import 'feature/dashboard/child/explore/presentation/bloc/campaign_bloc.dart';
import 'feature/dashboard/child/explore/presentation/bloc/listing_bloc.dart';
import 'feature/dashboard/child/explore/presentation/page/explore.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<CampaignBloc>()..add(GetCampaignsEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<ListingBloc>(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TravelA Campaigns',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
