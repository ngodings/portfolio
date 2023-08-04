import 'package:flutter/material.dart';

import 'package:portfolio/features/portfolio/widgets/portfolio_desktop.dart';
import 'package:portfolio/features/portfolio/widgets/portfolio_mobile.dart';
import 'package:portfolio/utils/responsive_utils.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PortfolioMobile(),
      tablet: PortfolioMobile(),
      desktop: PortfolioDesktop(),
    );
  }
}
