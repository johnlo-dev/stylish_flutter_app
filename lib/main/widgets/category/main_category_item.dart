import 'package:flutter/material.dart';
import 'package:flutter_project/general_widgets/vertical_spacer.dart';
import 'package:flutter_project/main/model/stylish_category.dart';

import '../../constants.dart';
import '../../model/product.dart';

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({super.key, required this.category});

  final StylishCategory category;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = screenWidth > Dimen.widthWideScreenSpec;
    Widget productList = getProductListView(isWideScreen);
    // calculate width to fit full screen size
    double wideScreenItemWidth = (screenWidth - Dimen.paddingGeneral * 3) / 3;

    return isWideScreen
        ? SizedBox(
            width: wideScreenItemWidth,
            child: Column(children: [
              Text(category.title),
              VerticalSpacer(spacerHeight: Dimen.paddingGeneralHalf),
              Expanded(child: productList)
            ]))
        : Column(
            children: [
              Text(category.title),
              VerticalSpacer(spacerHeight: Dimen.paddingGeneralHalf),
              productList
            ],
          );
  }

  Widget getProductListView(bool isWideScreen) {
    return ListView.builder(
        shrinkWrap: !isWideScreen,
        scrollDirection: Axis.vertical,
        itemCount: category.productList.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int position) {
          return ProductListItem(
            product: category.productList[position],
          );
        });
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimen.heightMainProduct,
        child: Padding(
            padding: EdgeInsets.fromLTRB(Dimen.paddingGeneralHalf, 0,
                Dimen.paddingGeneralHalf, Dimen.paddingGeneralHalf),
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimen.roundingGeneral))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimen.roundingGeneral),
                            bottomLeft: Radius.circular(Dimen.roundingGeneral)),
                        child: Image.network(
                          product.imageUrl,
                          width: Dimen.widthMainProductImage,
                          fit: BoxFit.cover,
                        )),
                    Expanded(
                        // to make text width flexible without overflow
                        child: Padding(
                            padding: EdgeInsets.all(Dimen.paddingGeneralHalf),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(product.name),
                                  Text("\$${product.price}")
                                ])))
                  ],
                ))));
  }
}
