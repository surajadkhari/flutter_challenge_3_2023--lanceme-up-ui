import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constant/app_color_constant.dart';
import '../../data/model/notification_category_model.dart';
import '../notification_screen.dart';

class NotificationCategorySection extends StatelessWidget {
  const NotificationCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var currentIndex = ref.watch(categoryIndexProvider);
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...NotificationCategoryModel.notificationTypesList.map((e) {
                  return InkWell(
                    onTap: () {
                      currentIndex = ref
                          .read(categoryIndexProvider.notifier)
                          .update((state) => NotificationCategoryModel
                              .notificationTypesList
                              .indexOf(e));
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: currentIndex ==
                                    NotificationCategoryModel
                                        .notificationTypesList
                                        .indexOf(e)
                                ? AppColorResources.appCategoryActivegreen
                                : AppColorResources.appNotificationTypeBG),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Text(
                          e.type,
                          style: TextStyle(
                              fontSize: 12,
                              color: currentIndex ==
                                      NotificationCategoryModel
                                          .notificationTypesList
                                          .indexOf(e)
                                  ? AppColorResources.white
                                  : AppColorResources.appBlack),
                        )),
                  );
                })
              ],
            ));
      },
    );
  }
}
