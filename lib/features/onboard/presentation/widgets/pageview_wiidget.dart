import 'package:flutter/material.dart';
import '../../../../common/constant/app_color_constant.dart';

class PageWidget extends StatelessWidget {
  const PageWidget(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title});
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Container(
      color: AppColorResources.bgScaffold,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                height: screenH * 0.59,
                width: screenW * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorResources.kTextLightGrey),
                child: Text(
                  image,
                  style: const TextStyle(
                      fontSize: 100, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
