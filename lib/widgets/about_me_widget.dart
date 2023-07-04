import 'package:flutter/material.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../configs/typography/app_text.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget(
      {super.key,
      required this.data,
      required this.information,
      this.alignment});
  final String data;
  final String information;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$data: ",
              style: AppText.l1b!.copyWith(
                color: appProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
            TextSpan(
              text: " $information\n",
              style: AppText.l1!.copyWith(
                color: appProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
