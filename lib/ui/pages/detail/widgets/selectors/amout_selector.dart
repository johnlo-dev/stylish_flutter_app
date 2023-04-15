import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/ui/pages/detail/detail_cubit.dart';

import '../../../../../constants.dart';
import 'selector_title.dart';

class AmountSelector extends StatelessWidget {
  AmountSelector({super.key, required int maxAmount}) : _maxAmount = maxAmount;

  final int _maxAmount;
  String _currentText = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.widthDetailContentNotWide,
      child: Row(
        children: [
          const SelectorTitle(title: Strings.detailTitleAmount),
          IconButton(
              onPressed: () {
                context.read<DetailCubit>().decreaseAmount();
              },
              icon: const Icon(Icons.remove_circle)),
          SizedBox(
            width: Dimens.widthAmountSelectorInputField,
            child: BlocBuilder<DetailCubit, IDetailViewState>(
                builder: (context, state) {
              final controller = TextEditingController();
              final amount = state.order.amount.toString();
              controller.text = amount;
              controller.selection =
                  TextSelection.collapsed(offset: amount.length);

              return TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    _currentText = text;
                    context.read<DetailCubit>().updateAmount(int.parse(text));
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                    LengthLimitingTextInputFormatter(10)
                  ],
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: controller);
            }),
          ),
          BlocBuilder<DetailCubit, IDetailViewState>(builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<DetailCubit>().increaseAmount();
                },
                icon: const Icon(Icons.add_circle));
          }),
        ],
      ),
    );
  }
}
