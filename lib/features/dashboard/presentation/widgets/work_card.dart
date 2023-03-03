import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_color_constant.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_images_constant.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../data/models/projects_model/project_model.dart';

class WordCardWidget extends StatelessWidget {
  const WordCardWidget({super.key, required this.e});

  final WorkModel e;
  @override
  Widget build(BuildContext context) {
    List<String> teamImage = [
      AppImagesConstant.kuser1,
      AppImagesConstant.kuser2,
      AppImagesConstant.kuser3,
      AppImagesConstant.kuser4,
      AppImagesConstant.kuser5
    ];
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColorResources.indicatorBG)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(e.projectName),
                    SizedBox(
                      width: screenW * 0.05,
                    ),
                    SvgPicture.asset(
                      AppIConsContant.appIconGlobe,
                      color: AppColorResources.appPrimaryColor,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AppIConsContant.appIconThreeDot,
                  color: AppColorResources.appBlack,
                ),
              ],
            ),
            SizedBox(
              height: screenH * 0.019,
            ),
            CardInfo(
              label: "Template",
              e: e.template,
            ),
            CardInfo(
              label: "Status",
              e: e.status,
            ),
            CardInfo(
              label: "Last Updated",
              e: e.lastUpdated,
            ),
            SizedBox(
              height: screenH * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: LinearPercentIndicator(
                      barRadius: const Radius.circular(5),
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      width: screenW * 0.75,
                      lineHeight: 6.0,
                      percent: e.workPercent / 100,
                      backgroundColor: AppColorResources.indicatorBG,
                      //  e.status == "On Process"
                      //     ? Colors.green.withOpacity(0.5)
                      //     : e.status == "Half Done"
                      //         ? Colors.orange.withOpacity(0.5)
                      //         : Colors.red.withOpacity(0.5),
                      progressColor: AppColorResources.appPrimaryColor
                      // e.status == "On Process"
                      //     ? Colors.green
                      //     : e.status == "Half Done"
                      //         ? Colors.orange
                      //         : Colors.red,
                      ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "${e.workPercent}%",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColorResources.appPrimaryColor,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: screenH * 0.06,
              width: screenW * 0.5,
              child: Stack(
                  children: List.generate(teamImage.length, (index) {
                return Positioned(
                    left: index * 30,
                    top: 9,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColorResources.white,
                      maxRadius: 26,
                      child: CircleAvatar(
                        backgroundColor: AppColorResources.white,
                        backgroundImage: AssetImage(teamImage[index]),
                        radius: 21,
                      ),
                    ));
              })),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.e, required this.label});

  final String e;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Text(
            e,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
