import 'package:flutter/material.dart';

import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:portfolio/provider/scroll_provider.dart';
import 'package:portfolio/utils/const.dart';
import 'package:portfolio/utils/navbar_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/navbar_logo_widget.dart';
import 'package:provider/provider.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return Drawer(
      child: Material(
        color: appProvider.isDark ? Colors.grey[900] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: NavBarLogo(),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: AppTheme.c!.primary,
                ),
                title: const Text('Dark'),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  onChanged: (value) {
                    appProvider
                        .setTheme(value ? ThemeMode.dark : ThemeMode.light);
                  },
                  value: appProvider.isDark,
                  activeColor: AppTheme.c!.primary,
                ),
              ),
              const Divider(),
              ...NavBarUtils.names.asMap().entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          scrollProvider.scrollMobile(e.key);
                          Navigator.pop(context);
                        },
                        hoverColor: AppTheme.c!.primary!.withAlpha(70),
                        child: ListTile(
                          leading: Icon(
                            NavBarUtils.icons[e.key],
                            color: AppTheme.c!.primary,
                          ),
                          title: Text(
                            e.value,
                            style: AppText.l1,
                          ),
                        ),
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () => openURL(StaticUtils.resume),
                  hoverColor: AppTheme.c!.primary!.withAlpha(150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: AppTheme.c!.primary!),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Resume',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
