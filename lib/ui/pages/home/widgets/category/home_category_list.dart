import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../model/stylish_category.dart';
import 'home_category_item.dart';

class MainCategoryList extends StatelessWidget {
  MainCategoryList({super.key, required List<StylishCategory> categoryList}): _categoryList = categoryList;

  final List<StylishCategory> _categoryList;

  @override
  Widget build(BuildContext context) {
    bool isWideScreen =
        MediaQuery.of(context).size.width > Dimens.widthWideScreenSpec;

    return Expanded(
        child: ListView.builder(
            scrollDirection: isWideScreen ? Axis.horizontal : Axis.vertical,
            itemCount: _categoryList.length,
            itemBuilder: (BuildContext context, int position) {
              return getCategoryItem(position);
            }));
  }

  Widget getCategoryItem(int position) {
    return Padding(
        padding: const EdgeInsets.all(Dimens.paddingHalf),
        child: MainCategoryItem(category: _categoryList[position]));
  }
}