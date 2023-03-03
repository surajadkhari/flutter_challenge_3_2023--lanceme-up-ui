class NotificationModel {
  final String time;
  final String status;
  final String label;
  final String type;

  NotificationModel(
      {required this.time,
      required this.status,
      required this.label,
      required this.type});
  static List<NotificationModel> notificationList = [
    NotificationModel(
        label: "Jane Copper has downloaded “Wireframing Landing Page.",
        time: "2m ago",
        status: "active",
        type: "download"),
    NotificationModel(
        label: "Jane Copper has mentioned you on Lancemeup workspace.",
        time: "2m ago",
        status: "active",
        type: "mentioned"),
    NotificationModel(
        label: "[REMINDER] Due date of Lancemeup Projects task will be coming",
        time: "2m ago",
        status: "no",
        type: "duedate"),
    NotificationModel(
        label: "Jane Copper has removed from workspace.",
        time: "2m ago",
        status: "no",
        type: "remove"),
    NotificationModel(
        label: "Jane Copper has removed from workspace.",
        time: "2m ago",
        status: "no",
        type: "reject"),
    NotificationModel(
        label: "Jane Copper reject the invitation from workspace.",
        time: "2m ago",
        status: "no",
        type: "accept"),
    NotificationModel(
        label: "Jane Copper reject the invitation from workspace.",
        time: "2m ago",
        status: "no",
        type: "accept")
  ];
}
