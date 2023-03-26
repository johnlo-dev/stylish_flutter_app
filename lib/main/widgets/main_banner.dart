import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MainBanner extends StatelessWidget {
  MainBanner({super.key, required this.bannerList});

  List<String> bannerList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimen.heightMainBanner,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerList.length,
            itemBuilder: (BuildContext context, int position) {
              return getBannerItem(position);
            }));
  }

  Widget getBannerItem(int position) {
    return Padding(
        padding: EdgeInsets.all(Dimen.paddingGeneralHalf),
        child: SizedBox(
            width: Dimen.widthMainBannerImage,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimen.roundingGeneral),
                child: Image.network(
                  bannerList[position],
                  fit: BoxFit.cover,
                ))));
  }
}
