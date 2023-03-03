import 'package:flutter/material.dart';
import 'package:lancemeup_workspace_ui/features/onboard/presentation/onboard_screen.dart';
import '../../../core/db_client.dart';
import '../../../utils/custom_navigation/app_nav.dart';
import '../../auth/presentation/signin_screen.dart';
import '../widgets/splash_screen_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      final DbClient db = DbClient();
      var data =
          await db.getData(dbKey: "onboard", dataType: LocalDataType.boolean) ??
              false;

      if (context.mounted) {
        pushAndRemoveUntil(
            context, data ? const SignUpScreen() : const OnboardScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenWidget(),
    );
  }
}
