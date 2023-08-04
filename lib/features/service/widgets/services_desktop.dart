import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/service_card.dart';

import '../../../configs/ui/space.dart';
import '../../../utils/service_utils.dart';
import '../../../widgets/custom_text_heading.dart';

class ServiceDesktop extends StatelessWidget {
  const ServiceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: Space.hf(4),
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nWhat I can do?',
          ),
          const CustomSectionSubHeading(
            text: 'I may not be perfect but surely I\'m of some use :)\n\n',
          ),
          Space.y!,
          Wrap(
            spacing: width * 0.05,
            runSpacing: height * 0.05,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: ServicesUtils.servicesIcons
                .asMap()
                .entries
                .map(
                  (e) => ServiceCardWidget(
                    serviceIcon: ServicesUtils.servicesIcons[e.key],
                    serviceTitle: ServicesUtils.servicesTitles[e.key],
                    serviceDescription:
                        ServicesUtils.servicesDescription[e.key],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
