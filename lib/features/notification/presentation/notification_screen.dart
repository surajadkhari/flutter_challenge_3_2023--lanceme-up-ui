import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';
import 'package:lancemeup_workspace_ui/features/notification/presentation/widgets/notification_categories_section.dart';
import '../../../common/constant/app_color_constant.dart';
import '../data/model/notification_model.dart';

final categoryIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  Color? colorFunction(String value) {
    return value == "download"
        ? AppColorResources.appDarkGreen
        : value == "mentioned"
            ? AppColorResources.kTextLightGrey
            : value == "duedate"
                ? AppColorResources.appBlue
                : value == "remove"
                    ? AppColorResources.appRed
                    : value == "reject"
                        ? AppColorResources.appOrange
                        : value == "accept"
                            ? AppColorResources.appPrimaryColor
                            : AppColorResources.appPrimaryColor;
  }

  String iconFunction({String? value}) {
    return value == "download"
        ? AppIConsContant.appIconDownload
        : value == "mentioned"
            ? AppIConsContant.appIconMention
            : value == "reject"
                ? AppIConsContant.appIconReject
                : value == "remove"
                    ? AppIConsContant.appIconUserRemove
                    : value == "duedate"
                        ? AppIConsContant.appIconDueDate
                        : value == "accept"
                            ? AppIConsContant.appIconAccept
                            : AppIConsContant.appIconActivity;
  }

  @override
  Widget build(BuildContext context) {
    // double screenW = MediaQuery.of(context).size.width;
    // double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColorResources.white,
      appBar: AppBar(
        leadingWidth: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset(AppIConsContant.appIconThreeDot),
          )
        ],
        title: Text("Notification",
            style: TextStyle(color: AppColorResources.appBlack)),
        backgroundColor: AppColorResources.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const NotificationCategorySection(),
              ...NotificationModel.notificationList.map((e) => Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 4),
                        minLeadingWidth: 20,
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: colorFunction(e.type),
                          child: SvgPicture.asset(iconFunction(value: e.type)),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(e.label),
                        ),
                        subtitle: Text(
                          e.time,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: e.status == "active"
                            ? const CircleAvatar(
                                maxRadius: 4,
                                backgroundColor:
                                    AppColorResources.appPrimaryColor,
                              )
                            : null,
                      ),
                      const Divider()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
