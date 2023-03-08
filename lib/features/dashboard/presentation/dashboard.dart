import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';
import 'package:lancemeup_workspace_ui/features/dashboard/presentation/widgets/features_section.dart';
import 'package:lancemeup_workspace_ui/features/dashboard/presentation/widgets/work_card.dart';
import '../../../common/constant/app_color_constant.dart';
import '../data/models/projects_model/project_model.dart';
import 'widgets/workspace_dropdown_widget.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColorResources.white,
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SvgPicture.asset(AppIConsContant.appIconSearchL),
            )
          ],
          leadingWidth: screenW * 0.6,
          backgroundColor: AppColorResources.white,
          leading: const WorkspaceDropDown()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FeaturesSection(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ...WorkModel.workList.map(
                    (e) => WordCardWidget(
                      e: e,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
