import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_card_widget.dart';

import '../../../animations/bottom_animation.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/ui/space.dart';
import '../../../utils/contact_utils.dart';
import '../../../widgets/custom_text_heading.dart';

class ContactDesktopScreen extends StatelessWidget {
  const ContactDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: Space.all(1, 1),
        child: Column(
          children: [
            const CustomSectionHeading(
              text: "\nGet in Touch",
            ),
            const CustomSectionSubHeading(
              text: "Let's build something together :)\n\n",
            ),
            Space.y!,
            Wrap(
                alignment: WrapAlignment.center,
                runSpacing: AppDimensions.normalize(10),
                children: ContactUtils.contactIcon
                    .asMap()
                    .entries
                    .map((e) => WidgetAnimator(
                          child: ProjectCardWidget(
                            projectIconData: e.value,
                            projectTitle: ContactUtils.titles[e.key],
                            projectDescription: ContactUtils.details[e.key],
                          ),
                        ))
                    .toList()),
          ],
        ));
  }
}
