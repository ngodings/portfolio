import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../animations/entrance_fader.dart';
import '../configs/app_dimensions.dart';
import '../configs/theme/app_theme.dart';
import '../provider/app_provider.dart';
import '../provider/scroll_provider.dart';

class ArrowOnTopWidget extends HookWidget {
  const ArrowOnTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return Positioned(
      bottom: AppDimensions.normalize(30),
      right: -7,
      child: EntranceFader(
        offset: const Offset(0, 20),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => scrollProvider.scroll(0),
                onHover: (isHovering) {
                  if (isHovering) {
                    isHover.value = true;
                  } else {
                    isHover.value = false;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: appProvider.isDark ? Colors.white : Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    boxShadow: isHover.value
                        ? [
                            const BoxShadow(
                              blurRadius: 12.0,
                              offset: Offset(2.0, 3.0),
                            )
                          ]
                        : [],
                  ),
                  child: Icon(
                    Icons.arrow_drop_up_outlined,
                    color: AppTheme.c!.primary!,
                    size: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}