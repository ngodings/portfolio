import 'package:flutter/material.dart';
import 'package:portfolio/features/contact/widgets/contact_desktop.dart';
import 'package:portfolio/features/contact/widgets/contact_mobile.dart';

import 'package:portfolio/utils/responsive_utils.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobileScreen(),
      tablet: ContactMobileScreen(),
      desktop: ContactDesktopScreen(),
    );
  }
}
