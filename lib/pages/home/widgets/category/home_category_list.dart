import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../model/stylish_category.dart';
import 'home_category_item.dart';

class MainCategoryList extends StatelessWidget {
  MainCategoryList({super.key, required this.categoryList});

  List<StylishCategory> categoryList = <StylishCategory>[];

  @override
  Widget build(BuildContext context) {
    bool isWideScreen =
        MediaQuery.of(context).size.width > Dimens.widthWideScreenSpec;

    return Expanded(
        child: ListView.builder(
            scrollDirection: isWideScreen ? Axis.horizontal : Axis.vertical,
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int position) {
              return getCategoryItem(position);
            }));
  }

  Widget getCategoryItem(int position) {
    return Padding(
        padding: EdgeInsets.all(Dimens.paddingHalf),
        child: MainCategoryItem(category: categoryList[position]));
  }
}