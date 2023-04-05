import 'package:flutter/material.dart';
import 'package:flutter_project/general_widgets/vertical_spacer.dart';

import '../../../detail/detail_page.dart';
import '../../../../constants.dart';
import '../../model/product.dart';
import '../../model/stylish_category.dart';

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({super.key, required this.category});

  final StylishCategory category;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = screenWidth > Dimens.widthWideScreenSpec;
    Widget productList = getProductListView(isWideScreen);
    // calculate width to fit full screen size
    double wideScreenItemWidth = (screenWidth - Dimens.paddingGeneral * 3) / 3;

    return isWideScreen
        ? SizedBox(
            width: wideScreenItemWidth,
            child: Column(children: [
              Text(category.title),
              VerticalSpacer(spacerHeight: Dimens.paddingHalf),
              Expanded(child: productList)
            ]))
        : Column(
            children: [
              Text(category.title),
              VerticalSpacer(spacerHeight: Dimens.paddingHalf),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                DetailPage(product: product)));
      },
      child: SizedBox(
          height: Dimens.heightMainProduct,
          child: Padding(
              padding: EdgeInsets.fromLTRB(Dimens.paddingHalf, 0,
                  Dimens.paddingHalf, Dimens.paddingHalf),
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.roundingGeneral))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.roundingGeneral),
                              bottomLeft: Radius.circular(Dimens.roundingGeneral)),
                          child: Image.network(
                            product.mainImage,
                            width: Dimens.widthMainProductImage,
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                          // to make text width flexible without overflow
                          child: Padding(
                              padding: EdgeInsets.all(Dimens.paddingHalf),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(product.title),
                                    Text("\$${product.price}")
                                  ])))
                    ],
                  )))),
    );
  }
}
