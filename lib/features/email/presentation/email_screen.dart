import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_images_constant.dart';

import '../../../common/constant/app_color_constant.dart';
import '../data/model/email_model.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  String imageTyepe(String value) {
    return value == "zip"
        ? AppIConsContant.appIconFileZip
        : AppIConsContant.appIconFileImage;
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          fixedSize: Size(screenW * 0.5, screenH * 0.07),
          elevation: 0,
          backgroundColor: AppColorResources.appComposeEmail,
          foregroundColor: AppColorResources.appCategoryActivegreen,
        ),
        onPressed: () {},
        icon: Icon(Icons.edit, color: AppColorResources.appBlack),
        label: Text(
          "Compose New Email",
          style: TextStyle(color: AppColorResources.appBlack),
        ),
      ),
      backgroundColor: AppColorResources.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundImage: AssetImage(AppImagesConstant.kuser2),
              ))
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: AppColorResources.appBlack,
            )),
        elevation: 1,
        title: SizedBox(
          height: 35,
          child: TextFormField(
            decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 12),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColorResources.kTextLightGrey, width: 0.5)),
                hintText: "Search mails"),
          ),
        ),
        backgroundColor: AppColorResources.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "All inbox",
                  style: TextStyle(
                      fontSize: 16, color: AppColorResources.kTextLightGrey),
                ),
              ),
              ...EmailModel.emailList.map((e) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          minVerticalPadding: 0,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          minLeadingWidth: 20,
                          leading: CircleAvatar(
                            backgroundColor: e.senderAvatar.isNotEmpty
                                ? AppColorResources.appNotificationTypeBG
                                : AppColorResources.appComposeEmail,
                            maxRadius: 20,
                            child: e.senderAvatar.isNotEmpty
                                ? Image.asset(e.senderAvatar)
                                : const Text("A"),
                          ),
                          title: Text(
                            e.emailTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 16),
                          ),
                          trailing: Text(e.time)),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, bottom: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.zero,
                                  width: screenW * 0.68,
                                  child: Text(
                                    e.emailBody,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.normal),
                                    maxLines: 2,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() => e.isStart = !e.isStart);
                                  },
                                  child: SvgPicture.asset(
                                    e.isStart
                                        ? AppIConsContant.appIconStar
                                        : AppIConsContant.appIconStarUnselected,
                                    height: 20,
                                  ),
                                )
                              ],
                            ),
                            if (e.fileName.isNotEmpty)
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  // width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(width: 0.1)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(imageTyepe(e.fileType)),
                                      // Icon(e.fileType == "zip"
                                      //     ? Icons.file_copy
                                      //     : Icons.abc),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e.fileName,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )),
                          ],
                        ),
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
