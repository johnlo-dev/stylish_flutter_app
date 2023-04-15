import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/ui/pages/detail/widgets/selectors/selector_title.dart';

import '../../../../../constants.dart';
import '../../../../../model/product.dart';
import '../../detail_cubit.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({super.key, required List<String> colorList}) : _colorList = colorList;

  final List<String> _colorList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.widthDetailContentNotWide,
      child: Row(
        children: [
          const SelectorTitle(title: Strings.detailTitleColor),
          Expanded(
            child: SizedBox(
              height: Dimens.heightColorSelectorItem,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _colorList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.only(right: Dimens.paddingHalf),
                      child: SizedBox(
                        width: Dimens.widthColorSelectorItem,
                        height: Dimens.heightColorSelectorItem,
                        child: BlocBuilder<DetailCubit, IDetailViewState>(
                            builder: (context, state) {
                          var isSelectedColor = false;
                          if (_colorList[position] == state.order.color) {
                            isSelectedColor = true;
                          }
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                // ElevatedButton styles
                                padding:
                                    const EdgeInsets.all(Dimens.paddingHalf),
                                backgroundColor:
                                    Product.parseColor(_colorList[position]),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                side: BorderSide(
                                    width: 1,
                                    color: isSelectedColor
                                        ? Colors.black87
                                        : Colors.transparent)),
                            onPressed: () {
                              context
                                  .read<DetailCubit>()
                                  .updateColor(_colorList[position]);
                            },
                            child: null,
                          );
                        }),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
