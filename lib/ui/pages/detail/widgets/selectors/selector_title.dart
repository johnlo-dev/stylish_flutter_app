import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../general_widgets/fix_size_divider.dart';


class SelectorTitle extends StatelessWidget {
  const SelectorTitle({super.key, required, required String title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        _title,
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
