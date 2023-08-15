import 'package:flutter/material.dart';
import 'package:portfolio/configs/ui/space.dart';
import 'package:portfolio/widgets/about_me_widget.dart';
import 'package:portfolio/widgets/community_button.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../configs/typography/app_text.dart';
import '../../../utils/about_utils.dart';
import '../../../utils/const.dart';
import '../../../utils/utils.dart';
import '../../../utils/work_utils.dart';
import '../../../widgets/custom_text_heading.dart';
import '../../../widgets/tech_widget.dart';

class AboutTablet extends StatelessWidget {
  const AboutTablet({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: Space.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: CustomSectionHeading(
              text: '\nAbout Me',
            ),
          ),
          const Center(
            child: CustomSectionSubHeading(
              text: 'Get to know me :)',
            ),
          ),
          Space.y1!,
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.27,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Who am I?",
            style: AppText.b2!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y1!,
          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            AboutUtils.aboutMeDetail,
            style: AppText.l1!.copyWith(
              height: 2,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
            ),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Text(
            'Technologies I have worked with:',
            style: AppText.l1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Row(
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutMeWidget(
                    data: "Name",
                    information: "Rike Aqila Nurfi",
                  ),
                  AboutMeWidget(
                    data: "Age",
                    information: "23",
                  ),
                ],
              ),
              SizedBox(
                width: width > 710 ? width * 0.2 : width * 0.05,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutMeWidget(
                    data: "Email",
                    information: "rikeaql@gmail.com",
                  ),
                  AboutMeWidget(
                    data: "From",
                    information: "Boyolali",
                  ),
                ],
              ),
            ],
          ),
          Space.y1!,
          Row(
            children: [
              SizedBox(
                height: AppDimensions.normalize(13),
                width: AppDimensions.normalize(40),
                child: OutlinedButton(
                  onPressed: () => html.window.open(StaticUtils.resume, 'pdf'),
                  child: const Text(
                    "Resume",
                  ),
                ),
              ),
              // Space.x!,
              // Container(
              //   width: width * 0.05,
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: Colors.grey[900]!,
              //         width: 2.0,
              //       ),
              //     ),
              //   ),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //       children: WorkUtils.logos
              //           .asMap()
              //           .entries
              //           .map(
              //             (e) => CommunityIconButton(
              //               icon: e.value,
              //               link: WorkUtils.communityLinks[e.key],
              //               height: WorkUtils.communityLogoHeight[e.key],
              //             ),
              //           )
              //           .toList()),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
