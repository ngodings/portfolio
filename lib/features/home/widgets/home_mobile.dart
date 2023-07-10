import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../configs/typography/app_text.dart';
import '../../../configs/ui/space.dart';
import '../../../utils/utils.dart';
import '../../../widgets/social_links.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 1.02,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            right: -AppDimensions.normalize(25),
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                StaticUtils.blackWhitePhoto,
                height: AppDimensions.normalize(150),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(10),
              AppDimensions.normalize(40),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "WELCOME THERE! ",
                      style: AppText.b2!.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Space.x!,
                    Image.asset(
                      StaticUtils.hi,
                      height: AppDimensions.normalize(10),
                    ),
                  ],
                ),
                Space.y!,
                Text(
                  'Lala',
                  style: AppText.h1!.copyWith(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.w100),
                ),
                Space.y!,
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: AppTheme.c!.primary!,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Software Quality Assurance',
                          speed: const Duration(milliseconds: 800),
                          textStyle: AppText.b1,
                        ),
                        TyperAnimatedText(
                          'Flutter Developer',
                          speed: const Duration(milliseconds: 800),
                          textStyle: AppText.b1,
                        ),
                        TyperAnimatedText(
                          'Tech Enthusiast',
                          speed: const Duration(milliseconds: 800),
                          textStyle: AppText.b1,
                        ),
                      ],
                      isRepeatingAnimation: true,
                    )
                  ],
                ),
                Space.y!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
