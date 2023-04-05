import 'package:flutter/material.dart';
import 'package:flutter_project/general_widgets/fix_size_divider.dart';
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
        const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
        Stack(
          children: [
            Visibility(
              visible: hasIcBack,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      })),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: Dimens.fontSizeHeader,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
        const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
        SizedBox(
            height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.grey))
      ],
    );
  }
}
