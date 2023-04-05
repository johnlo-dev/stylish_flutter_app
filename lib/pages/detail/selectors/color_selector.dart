
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/detail/selectors/selector_title.dart';

import '../../../constants.dart';
import '../../home/model/product.dart';


class ColorSelector extends StatelessWidget {
  const ColorSelector({super.key, required this.colorList});

  final List<String> colorList;

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
                  itemCount: colorList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.only(right: Dimens.paddingHalf),
                      child: SizedBox(
                        width: Dimens.widthColorSelectorItem,
                        height: Dimens.heightColorSelectorItem,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Product.parseColor(colorList[position])),
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
