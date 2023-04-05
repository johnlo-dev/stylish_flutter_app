import 'package:flutter/material.dart';
import 'package:flutter_project/general_widgets/fix_size_divider.dart';
import 'package:flutter_project/general_widgets/vertical_spacer.dart';
import 'package:flutter_project/pages/detail/selectors/color_selector.dart';
import 'package:flutter_project/pages/detail/selectors/size_selector.dart';
import 'package:flutter_project/pages/home/model/product.dart';

import '../../constants.dart';
import '../../general_widgets/stylish_header.dart';
import 'selectors/amout_selector.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

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
                      itemCount: product.images.length + 3,
                      itemBuilder: (BuildContext context, int position) {
                        switch (position) {
                          case 0 :
                            return const VerticalSpacer(spacerHeight: Dimens.paddingHalf);
                          case 1:
                            return getDynamicLayoutItem(context, product);
                          case 2:
                            return getDescriptionItem(
                                context, isWideScreen, product);
                          default:
                            return getImageItem(context, isWideScreen,
                                product.images[position - 3]);
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
        child: Image.network(product.mainImage, fit: BoxFit.cover),
      ),
      ContentSection(product: product)
    ];
  }

  Widget getDescriptionItem(
      BuildContext context, bool isWideScreen, Product product) {
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
          width: isWideScreen ? widthWide : widthNotWide,
          child: Text(product.description)),
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
  const ContentSection({super.key, required this.product});

  final Product product;

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
          children: [
            Text(
              product.title,
              style: const TextStyle(
                  fontSize: FontSizes.GeneralTitle,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
            Text(product.id.toString(),
                style: const TextStyle(
                    fontSize: FontSizes.GeneralContent, color: Colors.black)),
            const VerticalSpacer(spacerHeight: Dimens.paddingDouble),
            Text("NT\$${product.price}",
                style: const TextStyle(
                    fontSize: FontSizes.GeneralTitle,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const VerticalSpacer(spacerHeight: Dimens.paddingGeneral),
            const FixedSizeDivider(
              height: 1,
              width: Dimens.widthDetailContentNotWide - Dimens.paddingHalf * 2,
              color: Colors.grey,
              padding: 0,
            ),
            ColorSelector(colorList: product.colors),
            SizeSelector(sizeList: product.sizes),
            const AmountSelector(maxAmount: 666),
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
            Text(product.note),
            Text(product.texture),
            Text(product.wash),
            Text(Strings.detailTitlePlace + product.place)
          ],
        ),
      ),
    );
  }
}
