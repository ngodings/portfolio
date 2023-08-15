import 'package:flutter/material.dart';
import 'package:portfolio/animations/entrance_fader.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/utils/navbar_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/navbar_action_button.dart';
import 'package:portfolio/widgets/navbar_logo_widget.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

import '../../../configs/ui/space.dart';
import '../../../provider/app_provider.dart';
import '../../../provider/drawer_provider.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      padding: Space.all(),
      color: appProvider.isDark ? Colors.black : Colors.white,
      child: Row(
        children: [
          const NavBarLogo(),
          Space.xm!,
          ...NavBarUtils.names.asMap().entries.map(
                (e) => NavbarActionButton(label: e.value, index: e.key),
              ),
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 150),
            duration: const Duration(milliseconds: 350),
            child: MaterialButton(
              onPressed: () {
                html.window.open(StaticUtils.resume, "pdf");
              },
              hoverColor: AppTheme.c!.primary!.withAlpha(180),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: AppTheme.c!.primary!)),
              child: Padding(
                padding: Space.all(1.25, 0.45),
                child: Text(
                  'Resume',
                  style: AppText.l1b,
                ),
              ),
            ),
          ),
          Space.x!,
          // Switch(
          //   inactiveTrackColor: Colors.grey,
          //   value: appProvider.isDark,
          //   onChanged: (value) {
          //     appProvider.setTheme(!value ? ThemeMode.light : ThemeMode.dark);
          //   },
          //   activeColor: AppTheme.c!.primary!,
          // ),
          // Space.x!,
        ],
      ),
    );
  }
}

class NavbarTablet extends StatelessWidget {
  const NavbarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Padding(
      padding: Space.v!,
      child: Row(
        children: [
          Space.x1!,
          IconButton(
            highlightColor: Colors.white54,
            splashRadius: AppDimensions.normalize(10),
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          Space.xm!,
          const NavBarLogo(),
          Space.x1!,
        ],
      ),
    );
  }
}
