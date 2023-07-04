import 'package:flutter/material.dart';
import 'package:portfolio/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../../configs/app.dart';
import '../../provider/drawer_provider.dart';
import 'widgets/mobile_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [Container()],
        ),
      ),
    );
  }
}
