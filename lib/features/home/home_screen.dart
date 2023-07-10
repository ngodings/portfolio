import 'package:flutter/material.dart';
import 'package:portfolio/features/home/widgets/home_desktop.dart';
import 'package:portfolio/features/home/widgets/home_mobile.dart';
import 'package:portfolio/features/home/widgets/home_tab.dart';
import 'package:portfolio/utils/responsive_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}
