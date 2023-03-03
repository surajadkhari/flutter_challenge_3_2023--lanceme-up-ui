import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_color_constant.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_images_constant.dart';
import 'widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColorResources.white,
      appBar: AppBar(
        leadingWidth: 0,
        title: Text("Profile",
            style: TextStyle(color: AppColorResources.appBlack)),
        backgroundColor: AppColorResources.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: const AssetImage(AppImagesConstant.kuser1),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40),
                      child: CircleAvatar(
                        maxRadius: 10,
                        backgroundColor: AppColorResources.white,
                        child: const CircleAvatar(
                          backgroundColor: AppColorResources.appPrimaryColor,
                          maxRadius: 6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                "Jane Copper",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
              subtitle: Text(
                "janecopper@gmail.com",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColorResources.indicatorBG,
            ),
            const ProfileCard(
              lable: "Set Status",
              icon: AppIConsContant.appIconSetStatus,
            ),
            const ProfileCard(
              lable: "Account",
              icon: AppIConsContant.appIconPerson,
            ),
            const ProfileCard(
              lable: "Activity",
              icon: AppIConsContant.appIconActivity,
            ),
            const ProfileCard(
              lable: "Connection",
              icon: AppIConsContant.appIconConnection,
            ),
            Divider(
              thickness: 1,
              color: AppColorResources.indicatorBG,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "App Settings",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ProfileCard(
              lable: "Notification",
              icon: AppIConsContant.appIconNotification,
            ),
            const ProfileCard(
              lable: "Appearance",
              icon: AppIConsContant.appIconAppearance,
            ),
            Divider(
              thickness: 1,
              color: AppColorResources.indicatorBG,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "More",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ProfileCard(
              lable: "Privacy Policy",
              icon: AppIConsContant.appIconPolicy,
            ),
            const ProfileCard(
              lable: "Terms & Conditions",
              icon: AppIConsContant.appIconTerms,
            ),
            const ProfileCard(
              lable: "Help & Support",
              icon: AppIConsContant.appIconquestion,
            ),
            const ProfileCard(
              lable: "FAQs",
              icon: AppIConsContant.appIconquestion,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Account",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () {
                showModalBottomSheet(
                    // transitionAnimationController: controller,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Container(
                                  width: screenW * 0.2,
                                  height: screenH * 0.01,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColorResources.appBlack,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Are you sure?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Are you sure you want to Logout from the Workspace? ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  elevation: 0,
                                  // surfaceTintColor: AppColorResources.appPrimaryColor,
                                  backgroundColor: AppColorResources.appRed,
                                  foregroundColor: AppColorResources.white,
                                  fixedSize: Size(screenW, screenH * 0.058),
                                ),
                                onPressed: () async {},
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    "Cancel",
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
                      );
                    });
              },
              minLeadingWidth: 20,
              leading: SvgPicture.asset(
                AppIConsContant.appIconLogout,
                color: AppColorResources.appRed,
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColorResources.appRed,
                    ),
              ),
              // trailing: const Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
    );
  }
}
