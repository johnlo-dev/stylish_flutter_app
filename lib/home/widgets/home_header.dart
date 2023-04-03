import 'package:flutter/material.dart';

import '../../general_widgets/vertical_spacer.dart';
import '../constants.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key, this.title = ""});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacer(spacerHeight: Dimen.paddingGeneralHalf),
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Dimen.fontSizeHeader,
                color: Colors.black,
                decoration: TextDecoration.none)),
        VerticalSpacer(spacerHeight: Dimen.paddingGeneralHalf),
        const Divider(color: Colors.black)
      ],
    );
  }
}
