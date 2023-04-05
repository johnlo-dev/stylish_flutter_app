
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/detail/selectors/selector_title.dart';

import '../../../constants.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key, required this.sizeList});

  final List<String> sizeList;

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
                  itemCount: sizeList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return SizedBox( // Change the button size
                      width: Dimens.widthSizeSelectorItem,
                      child: Padding(
                        padding: const EdgeInsets.only(right: Dimens.paddingHalf),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom( // ElevatedButton styles
                              padding: const EdgeInsets.all(Dimens.paddingHalf), // Some padding example
                              shape: RoundedRectangleBorder( // Border
                                borderRadius: BorderRadius.circular(Dimens.roundingSizeSelector),
                              ),
                            backgroundColor: Colors.grey
                          ),
                          onPressed: () {},
                          child: Text(sizeList[position]),
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
