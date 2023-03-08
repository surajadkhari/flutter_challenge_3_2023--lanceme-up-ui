import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/constant/app_color_constant.dart';
import 'features/dashboard/presentation/dashboard.dart';
import 'features/email/presentation/email_screen.dart';
import 'features/notification/presentation/notification_screen.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'utils/app_buttom_nav/app_buttom_nav.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navIndexProvider);

    List<Widget> pages = [
      const DashBoard(),
      Container(),
      const EmailScreen(),
      const NotificationScreen(),
      const ProfileScreen()
    ];
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigation(pageIndex: navIndex),
      backgroundColor: AppColorResources.appPrimaryColor,
      // body: pages[navIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pages[navIndex],
      ),
    ));
  }
}
