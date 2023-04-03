import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import 'vertical_spacer.dart';

class StylishHeader extends StatelessWidget {
  StylishHeader({super.key, required this.hasIcBack});

  final bool hasIcBack;
  final String title = Strings.appHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacer(spacerHeight: Dimens.paddingGeneralHalf),
        Stack(
          children: [
            Visibility(
              visible: hasIcBack,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      icon: SvgPicture.asset(Images.icBack),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Dimens.fontSizeHeader,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
        VerticalSpacer(spacerHeight: Dimens.paddingGeneralHalf),
        const Divider(color: Colors.black)
      ],
    );
  }
}
