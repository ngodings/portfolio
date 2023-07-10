import 'package:flutter/material.dart';
import 'package:portfolio/utils/body_utils.dart';
import 'package:provider/provider.dart';

import '../../../provider/scroll_provider.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return ListView.builder(
      controller: scrollProvider.controller,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
    );
  }
}
