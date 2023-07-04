import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/animations/entrance_fader.dart';
import 'package:provider/provider.dart';

import '../configs/theme/app_theme.dart';
import '../configs/typography/app_text.dart';
import '../configs/ui/space.dart';
import '../provider/scroll_provider.dart';

class NavbarActionButton extends StatelessWidget {
  const NavbarActionButton(
      {super.key, required this.label, required this.index});
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return EntranceFader(
        child: Container(
      margin: Space.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: MaterialButton(
        onPressed: () {
          scrollProvider.scroll(index);
        },
        splashColor: Colors.white54,
        highlightColor: Colors.white54,
        hoverColor: AppTheme.c!.primary,
        child: Padding(
          padding: Space.all(0.5, 0.45),
          child: Text(
            label,
            style: AppText.l1,
          ),
        ),
      ),
    ));
  }
}
