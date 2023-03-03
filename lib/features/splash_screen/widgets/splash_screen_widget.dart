
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_color_constant.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColorResources.appPrimaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SvgPicture.asset(AppIConsContant.appIconLogo),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Text(
            "Version 0.0.1",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorResources.white, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
