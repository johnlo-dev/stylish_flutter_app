import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../model/product.dart';
import '../../detail/detail_page.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key, required List<Product> bannerList})
      : _bannerList = bannerList;

  final List<Product> _bannerList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimens.heightMainBanner,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _bannerList.length,
            itemBuilder: (BuildContext context, int position) {
              return getBannerItem(position, context);
            }));
  }

  Widget getBannerItem(int position, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Dimens.paddingHalf),
        child: SizedBox(
            width: Dimens.widthMainBannerImage,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DetailPage(product: _bannerList[position])));
                }, // Image tapped
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.roundingGeneral),
                    child: Image.network(
                      _bannerList[position].mainImage,
                      fit: BoxFit.cover,
                    )))));
  }
}
