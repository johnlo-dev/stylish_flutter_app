import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class MainBanner extends StatelessWidget {
  MainBanner({super.key, required this.bannerList});

  List<String> bannerList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimens.heightMainBanner,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerList.length,
            itemBuilder: (BuildContext context, int position) {
              return getBannerItem(position);
            }));
  }

  Widget getBannerItem(int position) {
    return Padding(
        padding: EdgeInsets.all(Dimens.paddingHalf),
        child: SizedBox(
            width: Dimens.widthMainBannerImage,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.roundingGeneral),
                child: Image.network(
                  bannerList[position],
                  fit: BoxFit.cover,
                ))));
  }
}
