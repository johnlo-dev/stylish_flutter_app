
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/ui/pages/detail/detail_cubit.dart';
import 'package:flutter_project/ui/pages/detail/widgets/selectors/selector_title.dart';

import '../../../../../constants.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key, required List<String> sizeList}) : _sizeList = sizeList;

  final List<String> _sizeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.widthDetailContentNotWide,
      child: Row(
        children: [
          const SelectorTitle(title: Strings.detailTitleSize),
          Expanded(
            child: SizedBox(
              height: Dimens.heightSizeSelectorItem,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _sizeList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return SizedBox( // Change the button size
                      width: Dimens.widthSizeSelectorItem,
                      child: Padding(
                        padding: const EdgeInsets.only(right: Dimens.paddingHalf),
                        child: BlocBuilder<DetailCubit, IDetailViewState>(
                          builder: (context, state) {
                            var isSelectedSize = false;
                            if (_sizeList[position] == state.order.size) {
                              isSelectedSize = true;
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom( // ElevatedButton styles
                                  padding: EdgeInsets.zero, // Some padding example
                                  shape: RoundedRectangleBorder( // Border
                                    borderRadius: BorderRadius.circular(Dimens.roundingSizeSelector),
                                  ),
                                backgroundColor: isSelectedSize? Colors.black87 : Colors.grey
                              ),
                              onPressed: () {
                                context.read<DetailCubit>().updateSize(_sizeList[position]);
                              },
                              child: Text(_sizeList[position]),
                            );
                          }
                        ),
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
