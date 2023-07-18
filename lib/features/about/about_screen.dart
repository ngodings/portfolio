import 'package:flutter/material.dart';
import 'package:portfolio/features/about/widgets/about_desktop.dart';
import 'package:portfolio/utils/responsive_utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AboutDesktop(),
        tablet: AboutDesktop(),
        desktop: AboutDesktop());
  }
}
