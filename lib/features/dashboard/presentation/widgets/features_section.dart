import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_color_constant.dart';
import '../../data/models/features_model/features_model.dart';

class FeaturesSection extends StatefulWidget {
  const FeaturesSection({super.key});

  @override
  State<FeaturesSection> createState() => _FeaturesSectionState();
}

class _FeaturesSectionState extends State<FeaturesSection> {
  late int featuredIndex;
  @override
  void initState() {
    featuredIndex = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenH * 0.05,
      child: ListView.builder(
        itemCount: FeaturesModel.featuresList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = FeaturesModel.featuresList[index];
          return InkWell(
            onTap: () {
              setState(() {
                featuredIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: featuredIndex == index ? 2 : 0.5,
                          color: featuredIndex == index
                              ? AppColorResources.appPrimaryColor
                              : AppColorResources.kTextLightGrey))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    data.iconData,
                    color: featuredIndex == index
                        ? AppColorResources.appPrimaryColor
                        : AppColorResources.kTextLightGrey,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    data.featuresName,
                    style: TextStyle(
                        color: featuredIndex == index
                            ? AppColorResources.appPrimaryColor
                            : AppColorResources.kTextLightGrey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
