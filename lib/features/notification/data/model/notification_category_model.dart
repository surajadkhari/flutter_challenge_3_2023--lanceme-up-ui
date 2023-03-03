class NotificationCategoryModel {
  final String type;

  NotificationCategoryModel({required this.type});

  static List<NotificationCategoryModel> notificationTypesList = [
    NotificationCategoryModel(type: "All"),
    NotificationCategoryModel(type: "Invites"),
    NotificationCategoryModel(type: "Mentions"),
    NotificationCategoryModel(type: "Workspace"),
    NotificationCategoryModel(type: "Unread"),
  ];
}
