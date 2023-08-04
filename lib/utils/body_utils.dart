import 'package:flutter/material.dart';
import 'package:portfolio/features/about/about_screen.dart';
import 'package:portfolio/features/contact/contact_screen.dart';
import 'package:portfolio/features/home/home_screen.dart';
import 'package:portfolio/features/portfolio/portfolio_screen.dart';
import 'package:portfolio/features/service/service_screen.dart';

import '../widgets/footer_widget.dart';

class BodyUtils {
  static const List<Widget> views = [
    HomeScreen(),
    AboutScreen(),
    ServiceScreen(),
    PortfolioScreen(),
    ContactScreen(),
    Footer(),
  ];
}
