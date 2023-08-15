import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/configs/ui/space.dart';
import 'package:portfolio/utils/const.dart';
import 'package:provider/provider.dart';

import '../configs/app_dimensions.dart';
import '../configs/theme/app_theme.dart';
import '../configs/typography/app_text.dart';
import '../provider/app_provider.dart';
import '../utils/utils.dart';

class ProjectCardWidget extends HookWidget {
  const ProjectCardWidget({
    Key? key,
    this.banner,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
    this.widthSize,
    this.heightSize,
  }) : super(key: key);
  final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;
  final double? widthSize;
  final double? heightSize;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    final appProvider = Provider.of<AppProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: projectLink == null ? () {} : () => openURL(projectLink!),
      onHover: (isHovering) {
        if (isHovering) {
          isHover.value = true;
        } else {
          isHover.value = false;
        }
      },
      child: Container(
        margin: Space.h,
        padding: Space.all(),
        width: widthSize ?? AppDimensions.normalize(150),
        height: heightSize ?? AppDimensions.normalize(90),
        decoration: BoxDecoration(
          color: appProvider.isDark ? Color(0xFF051113) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: appProvider.isDark
              ? [
                  BoxShadow(
                    color: AppTheme.c!.primary!.withAlpha(0),
                    blurRadius: 0.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 6.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                projectIcon != null
                    ? (width > 1135 || width < 950)
                        ? Image.asset(
                            projectIcon!,
                            height: height * 0.05,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                projectIcon!,
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                projectTitle,
                                style: AppText.b2b,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                    : Container(),
                projectIcon != null
                    ? Icon(
                        projectIconData,
                        color: AppTheme.c!.primary,
                      )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                        height: height * 0.02,
                      )
                    : const SizedBox(),
                (width > 1135 || width < 950)
                    ? Text(
                        projectTitle,
                        style: AppText.b2b,
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  projectDescription,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover.value ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
                child: banner != null
                    ? Container()
                    // Image.asset(
                    //     banner!,
                    //     fit: BoxFit.fill,
                    //   )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
