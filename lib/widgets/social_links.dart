import 'package:flutter/material.dart';
import 'package:portfolio/configs/ui/space.dart';
import 'package:portfolio/utils/const.dart';
import 'package:portfolio/utils/responsive_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

import '../configs/app_dimensions.dart';
import '../provider/app_provider.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Wrap(
      runSpacing: AppDimensions.normalize(10),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL
          .asMap()
          .entries
          .map((e) => Padding(
                padding:
                    Responsive.isMobile(context) ? Space.all(0.2, 0) : Space.h!,
                child: IconButton(
                  highlightColor: Colors.white54,
                  splashRadius: AppDimensions.normalize(12),
                  icon: Image.network(
                    e.value,
                    color: appProvider.isDark ? Colors.white : Colors.black,
                    height: Responsive.isMobile(context)
                        ? AppDimensions.normalize(10)
                        : null,
                  ),
                  iconSize: Responsive.isMobile(context)
                      ? AppDimensions.normalize(10)
                      : AppDimensions.normalize(15),
                  onPressed: () => openURL(StaticUtils.socialLinks[e.key]),
                ),
              ))
          .toList(),
    );
  }
}
