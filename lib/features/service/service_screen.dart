import 'package:flutter/material.dart';

import 'package:portfolio/utils/responsive_utils.dart';

import 'widgets/services_desktop.dart';
import 'widgets/services_mobile.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
