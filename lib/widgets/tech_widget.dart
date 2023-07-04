import 'package:flutter/material.dart';

import '../configs/app_dimensions.dart';
import '../configs/theme/app_theme.dart';
import '../configs/typography/app_text.dart';

class ToolTechWidget extends StatelessWidget {
  const ToolTechWidget({super.key, required this.techName});
  final String techName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.play_arrow,
          color: AppTheme.c!.primary,
          size: AppDimensions.normalize(6),
        ),
        Text(
          " $techName ",
          style: AppText.l1b,
        )
      ],
    );
  }
}
