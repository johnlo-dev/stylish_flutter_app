import 'package:flutter/material.dart';
import 'package:flutter_project/general_widgets/fix_size_divider.dart';

import '../../../constants.dart';

class SelectorTitle extends StatelessWidget {
  const SelectorTitle({super.key, required, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
      const FixedSizeDivider(
        height: 20,
        width: 1,
        color: Colors.grey,
        padding: Dimens.paddingHalf,
      ),
    ]);
  }
}
