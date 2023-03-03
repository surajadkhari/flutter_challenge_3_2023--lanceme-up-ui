import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_color_constant.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';

final navIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navIndexProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(color: AppColorResources.indicatorBG))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () =>
                ref.read(navIndexProvider.notifier).update((state) => 0),
            child: Column(
              children: [
                SvgPicture.asset(AppIConsContant.appIconHome,
                    color: navIndex == 0
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.appbuttomnavInactive),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 12,
                      color: navIndex == 0
                          ? AppColorResources.appPrimaryColor
                          : AppColorResources.appbuttomnavInactive),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                ref.read(navIndexProvider.notifier).update((state) => 1),
            child: Column(
              children: [
                SvgPicture.asset(AppIConsContant.appIconSearchLight,
                    color: navIndex == 1
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.appbuttomnavInactive),
                Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 12,
                    color: navIndex == 1
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.appbuttomnavInactive,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                ref.read(navIndexProvider.notifier).update((state) => 2),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(AppIConsContant.appIconEmail,
                        color: navIndex == 2
                            ? AppColorResources.appPrimaryColor
                            : AppColorResources.appbuttomnavInactive),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, bottom: 4),
                      child: CircleAvatar(
                        backgroundColor: AppColorResources.appPrimaryColor,
                        maxRadius: 8,
                        child: Text(
                          "3",
                          style: TextStyle(
                              color: AppColorResources.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 12,
                      color: navIndex == 2
                          ? AppColorResources.appPrimaryColor
                          : AppColorResources.appbuttomnavInactive),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                ref.read(navIndexProvider.notifier).update((state) => 3),
            child: Column(
              children: [
                SvgPicture.asset(AppIConsContant.appIconNotificationNav,
                    color: navIndex == 3
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.appbuttomnavInactive),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Notification",
                  style: TextStyle(
                      fontSize: 12,
                      color: navIndex == 3
                          ? AppColorResources.appPrimaryColor
                          : AppColorResources.appbuttomnavInactive),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                ref.read(navIndexProvider.notifier).update((state) => 4),
            child: Column(
              children: [
                SvgPicture.asset(AppIConsContant.appIconPerson,
                    color: navIndex == 4
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.appbuttomnavInactive),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Person",
                  style: TextStyle(
                    fontSize: 12,
                    color: navIndex == 4
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.appbuttomnavInactive,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
