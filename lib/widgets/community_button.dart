import 'package:flutter/material.dart';

import '../configs/ui/space.dart';
import '../utils/const.dart';

class CommunityIconButton extends StatelessWidget {
  const CommunityIconButton(
      {super.key,
      required this.icon,
      required this.link,
      required this.height});
  final String icon;
  final String link;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.h!,
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Image.asset(
          icon,
          height: height,
        ),
        onTap: () => openURL(link),
      ),
    );
  }
}
