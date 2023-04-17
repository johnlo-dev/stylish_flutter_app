import 'package:flutter/material.dart';
import 'package:flutter_project/ui/pages/detail/widgets/selectors/amout_selector.dart';
import 'package:flutter_project/ui/pages/detail/widgets/selectors/color_selector.dart';
import 'package:flutter_project/ui/pages/detail/widgets/selectors/size_selector.dart';

import '../../../constants.dart';
import '../../../model/product.dart';
import '../../general_widgets/fix_size_divider.dart';
import '../../general_widgets/stylish_header.dart';
import '../../general_widgets/vertical_spacer.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required Product product}) : _product = product;

  final Product _product;

  @override
  Widget build(BuildContext context) {
    bool isWideScreen =
        MediaQuery.of(context).size.width > Dimens.widthWideScreenSpec;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                StylishHeader(hasIcBack: true),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _product.images.length + 3,
                      itemBuilder: (BuildContext context, int position) {
                        switch (position) {
                          case 0:
                            return const VerticalSpacer(
                                spacerHeight: Dimens.paddingHalf);
                          case 1:
                            return getDynamicLayoutItem(context, _product);
                          case 2:
                            return getStoryItem(
                                context, isWideScreen, _product.story);
                          default:
                            return getImageItem(context, isWideScreen,
                                _product.images[position - 3]);
                        }
                      }),
                ),
              ],
            )));
  }

  Widget getDynamicLayoutItem(BuildContext context, Product product) {
    bool isWideScreen =
        MediaQuery.of(context).size.width > Dimens.widthWideScreenSpec;

    return isWideScreen
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getDynamicLayoutContent(),
          )
        : Column(
            children: getDynamicLayoutContent(),
          );
  }

  List<Widget> getDynamicLayoutContent() {
    return <Widget>[
      SizedBox(
        width: Dimens.widthDetailContentNotWide,
        height: Dimens.heightDetailMainImage,
        child: Image.network(_product.mainImage, fit: BoxFit.cover),
      ),
      ContentSection(product: _product)
    ];
  }

  Widget getStoryItem(BuildContext context, bool isWideScreen, String story) {
    const widthWide = Dimens.widthDetailContentWide;
    const widthNotWide =
        Dimens.widthDetailContentNotWide - Dimens.paddingHalf * 2;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
      SizedBox(
        width: isWideScreen ? widthWide : widthNotWide,
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: Dimens.paddingGeneral),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.indigoAccent, Colors.cyan],
                  ).createShader(bounds),
                  child: const Text(
                    Strings.detailTitleDescription,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            Expanded(
              child: SizedBox(height: 1, child: Container(color: Colors.black)),
            ),
          ],
        ),
      ),
      SizedBox(
          width: isWideScreen ? widthWide : widthNotWide, child: Text(story)),
      const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
    ]);
  }

  Widget getImageItem(
      BuildContext context, bool isWideScreen, String imageUrl) {
    const widthWide = Dimens.widthDetailContentWide;
    const widthNotWide =
        Dimens.widthDetailContentNotWide - Dimens.paddingHalf * 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.paddingHalf),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: isWideScreen ? widthWide : widthNotWide,
            height: (isWideScreen ? widthWide : widthNotWide) *
                Dimens.ratioDetailMoreImages,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  const ContentSection({super.key, required Product product})
      : _product = product;

  final Product _product;

  @override
  Widget build(BuildContext context) {
    bool isWideScreen =
        MediaQuery.of(context).size.width > Dimens.widthWideScreenSpec;

    return SizedBox(
      width: Dimens.widthDetailContentNotWide,
      child: Padding(
        padding: EdgeInsets.all(
            isWideScreen ? Dimens.paddingGeneral : Dimens.paddingHalf),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              _product.title,
              style: const TextStyle(
                  fontSize: FontSizes.generalTitle,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
            Text(_product.id.toString(),
                style: const TextStyle(
                    fontSize: FontSizes.generalContent, color: Colors.black)),
            const VerticalSpacer(spacerHeight: Dimens.paddingDouble),
            Text("NT\$${_product.price}",
                style: const TextStyle(
                    fontSize: FontSizes.generalTitle,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const VerticalSpacer(spacerHeight: Dimens.paddingGeneral),
            const FixedSizeDivider(
              height: 1,
              width: Dimens.widthDetailContentNotWide - Dimens.paddingHalf * 2,
              color: Colors.grey,
              padding: 0,
            ),
            ColorSelector(
                colorList: _product.colors.map((color) => color.code).toList()),
            SizeSelector(sizeList: _product.sizes),
            AmountSelector(maxAmount: 666),
            SizedBox(
              height: Dimens.heightSizeSelectorButton,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // Some padding example
                    shape: RoundedRectangleBorder(
                      // Border
                      borderRadius: BorderRadius.circular(0),
                    ),
                    backgroundColor: Colors.black54),
                onPressed: () {},
                child: const Text(Strings.detailTitleSelectSize),
              ),
            ),
            // SizeSelector(sizeList: product.sizes),
            // countView(),
            const VerticalSpacer(spacerHeight: Dimens.paddingGeneral),
            Text(Strings.detailTitleTexture + _product.texture),
            Text(_product.description),
            Text(Strings.detailTitlePlace + _product.place),
            Text(Strings.detailTitleWash + _product.wash),
            Text(_product.note),
          ],
        ),
      ),
    );
  }
}
