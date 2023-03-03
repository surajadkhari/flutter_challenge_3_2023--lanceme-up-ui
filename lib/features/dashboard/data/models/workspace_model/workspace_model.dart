import 'package:lancemeup_workspace_ui/common/constant/app_images_constant.dart';

class WorkSpaceModel {
  String name;
  String logo;

  WorkSpaceModel({required this.name, required this.logo});
  static List<WorkSpaceModel> workspaceList = [
    WorkSpaceModel(name: 'Lancemeup', logo: AppImagesConstant.kworkspace1),
    WorkSpaceModel(name: 'Item 2', logo: AppImagesConstant.kuser2),
    WorkSpaceModel(name: 'Item 3', logo: AppImagesConstant.kuser3),
  ];
}
