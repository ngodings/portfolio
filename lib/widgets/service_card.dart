import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/widgets/services_card_back.dart';
import 'package:provider/provider.dart';

import '../configs/app_dimensions.dart';
import '../configs/theme/app_theme.dart';
import '../configs/ui/space.dart';
import '../provider/app_provider.dart';
import '../utils/utils.dart';

class ServiceCardWidget extends HookWidget {
  const ServiceCardWidget({
    Key? key,
    required this.serviceIcon,
    required this.serviceTitle,
    required this.serviceDescription,
  }) : super(key: key);

  final String serviceIcon;
  final String serviceTitle;
  final String serviceDescription;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    final isHover = useState(false);
    final appProvider = Provider.of<AppProvider>(context);

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        cardKey.currentState!.toggleCard();
      },
      onHover: (isHovering) {
        if (isHovering) {
          isHover.value = true;
        } else {
          isHover.value = false;
        }
      },
      child: FlipCard(
        flipOnTouch: kIsWeb ? false : true,
        key: cardKey,
        front: Container(
            width: AppDimensions.normalize(100),
            height: AppDimensions.normalize(80),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(StaticUtils.sparkgif),
                fit: BoxFit.cover,
              ),
              color: appProvider.isDark ? Color(0xFF051113) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: isHover.value
                  ? [
                      BoxShadow(
                        color: AppTheme.c!.primary!.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  serviceIcon,
                  height: AppDimensions.normalize(30),
                  color: serviceIcon.contains(StaticUtils.openSource) &&
                          !appProvider.isDark
                      ? Colors.black
                      : null,
                ),
                Space.y1!,
                Text(
                  serviceTitle,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        back: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: isHover.value
                ? [
                    BoxShadow(
                      color: AppTheme.c!.primary!.withAlpha(100),
                      blurRadius: 12.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 12.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ],
          ),
          child: ServiceCardBackWidget(
            serviceDesc: serviceDescription,
            serviceTitle: serviceTitle,
          ),
        ),
      ),
    );
  }
}
