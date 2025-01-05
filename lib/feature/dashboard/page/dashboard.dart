import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela/core/config/theme/color.dart';
import 'package:travela/core/widget/custom_widget.dart';
import 'package:travela/feature/dashboard/child/be_a_host/be_a_host.dart';
import 'package:travela/feature/dashboard/child/booking/booking.dart';
import 'package:travela/feature/dashboard/child/explore/presentation/page/explore.dart';
import 'package:travela/feature/dashboard/child/inbox/inbox.dart';
import 'package:travela/feature/dashboard/child/profile/profile.dart';

import '../../../core/utils/Image_keys.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static  final List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    const BookingScreen(),
    const InboxScreen(),
    const ProfileScreen(),
    const BeAHostScreen(),
  ];

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Function to handle item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: DashboardScreen._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.brandPink6D,
        unselectedItemColor: AppColors.gray70,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // set the currently selected index
        onTap: _onItemTapped, // handle item tap
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              getSvg(
                TrImageEnumsKeys.search,
              ),
              colorFilter:  ColorFilter.mode(_selectedIndex==0?AppColors.brandPink6D:AppColors.gray70, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              getSvg(
                TrImageEnumsKeys.booking,
              ),
              colorFilter:  ColorFilter.mode(_selectedIndex==1?AppColors.brandPink6D:AppColors.gray70, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              getSvg(
                TrImageEnumsKeys.inbox,
              ),
              colorFilter:  ColorFilter.mode(_selectedIndex==2?AppColors.brandPink6D:AppColors.gray70, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              getSvg(
                TrImageEnumsKeys.profile,
              ),
              colorFilter:  ColorFilter.mode(_selectedIndex==3?AppColors.brandPink6D:AppColors.gray70, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              getSvg(
                TrImageEnumsKeys.host,
              ),
              colorFilter:  ColorFilter.mode(_selectedIndex==4?AppColors.brandPink6D:AppColors.gray70, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
            label: 'Be a Host',
          ),
        ],
      ),
    );
  }
}
