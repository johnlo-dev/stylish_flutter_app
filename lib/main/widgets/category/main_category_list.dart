import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main/widgets/category/main_category_item.dart';

import '../../constants.dart';
import '../../model/stylish_category.dart';

class MainCategoryList extends StatelessWidget {
  MainCategoryList({super.key, required this.categoryList});

  List<StylishCategory> categoryList = <StylishCategory>[];

  @override
  Widget build(BuildContext context) {
    bool isWideScreen =
        MediaQuery.of(context).size.width < Dimen.widthWideScreenSpec;

    return Expanded(
        child: ListView.builder(
            scrollDirection: isWideScreen ? Axis.vertical : Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int position) {
              return getCategoryItem(position, isWideScreen);
            }));
  }

  Widget getCategoryItem(int position, bool isWideScreen) {
    return isWideScreen
        ? Wrap(children: [getCategoryItemView(position)])
        : Expanded(child: getCategoryItemView(position));
  }

  Widget getCategoryItemView(int position) {
    return Padding(
        padding: EdgeInsets.all(Dimen.paddingGeneralHalf),
        child: MainCategoryItem(category: categoryList[position]));
  }
}
