import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lancemeup_workspace_ui/features/auth/presentation/signin_screen.dart';
import 'package:lancemeup_workspace_ui/features/onboard/presentation/widgets/pageview_wiidget.dart';
import 'package:lancemeup_workspace_ui/utils/custom_navigation/app_nav.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/constant/app_color_constant.dart';
import '../../../core/db_client.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController controller;
  late bool isLastPage;
  @override
  void initState() {
    controller = PageController();
    isLastPage = false;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomSheet: isLastPage
          ? Consumer(
              builder: (context, ref, child) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                      backgroundColor: AppColorResources.appPrimaryColor,
                      foregroundColor: AppColorResources.white,
                      fixedSize: Size(screenW, screenH * 0.058),
                    ),
                    onPressed: () async {
                      await ref.read(dbClientProvider).setData(
                          dataType: LocalDataType.boolean,
                          dbKey: "onboard",
                          value: true);

                      if (context.mounted) {
                        normalNav(
                            context: context, screen: const SignUpScreen());
                      }
                    },
                    child: const Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ))
          : Container(
              color: AppColorResources.bgScaffold,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: screenH * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      effect: const ExpandingDotsEffect(
                          activeDotColor: AppColorResources.appPrimaryColor,
                          expansionFactor: 2,
                          dotWidth: 10,
                          dotHeight: 10),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                      backgroundColor: AppColorResources.appPrimaryColor,
                      foregroundColor: AppColorResources.white,
                      fixedSize: Size(screenW, screenH * 0.058),
                    ),
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            color: AppColorResources.kTextLightGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      body: Container(
        margin: const EdgeInsets.only(top: 23),
        padding: const EdgeInsets.only(bottom: 10, top: 0),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          controller: controller,
          children: const [
            PageWidget(
              image: "img1",
              title: "What is Lorem Ipsum?",
              subtitle:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            PageWidget(
              image: "img1",
              title: "What is Lorem Ipsum?",
              subtitle:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            PageWidget(
              image: "img1",
              title: "What is Lorem Ipsum?",
              subtitle:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
          ],
        ),
      ),
    );
  }
}
