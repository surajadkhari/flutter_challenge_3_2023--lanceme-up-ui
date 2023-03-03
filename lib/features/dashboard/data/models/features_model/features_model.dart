import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';

class FeaturesModel {
  final String featuresName;
  final String iconData;

  FeaturesModel({required this.featuresName, required this.iconData});
  static List<FeaturesModel> featuresList = [
    FeaturesModel(
        featuresName: "Project Tools",
        iconData: AppIConsContant.appIconProjectTool),
    FeaturesModel(featuresName: "Chat", iconData: AppIConsContant.appIconChat),
    FeaturesModel(
        featuresName: "Drive", iconData: AppIConsContant.appIconDrive),
    FeaturesModel(featuresName: "Tract", iconData:  AppIConsContant.appIconTract),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
    // FeaturesModel(featuresName: "Tract", iconData: Icons.drafts),
  ];
}
