import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import 'selector_title.dart';

class AmountSelector extends StatelessWidget {
  const AmountSelector({super.key, required this.maxAmount});

  final int maxAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.widthDetailContentNotWide,
      child: Row(
        children: [
          const SelectorTitle(title: Strings.detailTitleAmount),
          const IconButton(onPressed: null, icon: Icon(Icons.remove_circle)),
          SizedBox(
            width: Dimens.widthAmountSelectorInputField,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                LengthLimitingTextInputFormatter(10)
              ],
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: InputBorder.none),
              initialValue: "1",
            ),
          ),
          const IconButton(onPressed: null, icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
