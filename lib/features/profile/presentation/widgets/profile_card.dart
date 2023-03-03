import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_icons.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, required this.icon, required this.lable, this.onTap});
  final String icon;
  final String lable;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        minLeadingWidth: 20,
        leading: SvgPicture.asset(
          icon,
          height: 20,
        ),
        title: Text(
          lable,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: SvgPicture.asset(
          AppIConsContant.appIconArrowRight,
          height: 11,
        ));
  }
}
