import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/ui/pages/home/home_cubit.dart';

import '../../../constants.dart';
import '../../../model/stylish_category.dart';
import '../../general_widgets/stylish_header.dart';
import 'widgets/category/home_category_list.dart';
import 'widgets/home_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchHomeProductLists();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body:
          BlocBuilder<HomeCubit, IHomeViewState>(builder: (context, state) {
            final bannerList = state.homeViewEntity.bannerList;
            final femaleList = state.homeViewEntity.femaleList;
            final maleList = state.homeViewEntity.maleList;
            final accessoryList = state.homeViewEntity.accessoryList;

            return Column(children: [
              StylishHeader(hasIcBack: false),
              MainBanner(bannerList: bannerList),
              MainCategoryList(categoryList: [
                StylishCategory(
                    femaleList.isNotEmpty ? Strings.categoryFemale : "",
                    femaleList),
                StylishCategory(
                    maleList.isNotEmpty ? Strings.categoryMale : "", maleList),
                StylishCategory(
                    accessoryList.isNotEmpty ? Strings.categoryAccessory : "",
                    accessoryList),
              ])
            ]);
          })),
    );
  }
}
