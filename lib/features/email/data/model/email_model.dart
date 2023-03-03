import 'package:lancemeup_workspace_ui/common/constant/app_images_constant.dart';

class EmailModel {
  final String senderAvatar;
  final String emailTitle;
  final String emailBody;
  final String time;
  final String fileName;
  final String fileType;
  bool isStart;
  EmailModel({
    this.fileName = "",
    this.fileType = "",
    this.isStart = false,
    this.senderAvatar = "",
    required this.emailTitle,
    required this.emailBody,
    required this.time,
  });
  static List<EmailModel> emailList = [
    EmailModel(
        senderAvatar: AppImagesConstant.kuser2,
        emailTitle: "Welcome to LMU mailer",
        emailBody:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        time: "8:00 AM"),
    EmailModel(
        isStart: true,
        // senderAvatar: AppImagesConstant.kuser2,
        emailTitle: "Unread email & starred",
        emailBody:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        time: "Dec 19"),
    EmailModel(
        fileName: "CoverPreview.jpg",
        fileType: "jpg",
        emailTitle: "Important Email",
        emailBody:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        time: "Dec 19"),
    EmailModel(
      fileName: "image_file.zip",
      fileType: "zip",
      senderAvatar: AppImagesConstant.kuser2,
      emailTitle: "Email with Attachment",
      emailBody:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
      time: "Dec 19",
    ),
    EmailModel(
        emailTitle: "Email with zip Attachment",
        emailBody:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        time: "Dec 19")
  ];
}
