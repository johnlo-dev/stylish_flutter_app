import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/ui/pages/detail/detail_cubit.dart';
import '../../constants.dart';
import 'vertical_spacer.dart';

class StylishHeader extends StatelessWidget {
  StylishHeader({super.key, required this.hasIcBack});

  final bool hasIcBack;
  final String title = Strings.appHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
        Stack(
          children: [
            Visibility(
              visible: hasIcBack,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<DetailCubit>().clearOrder();
                      })),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: Dimens.fontSizeHeader,
                      color: Colors.black,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
        const VerticalSpacer(spacerHeight: Dimens.paddingHalf),
        SizedBox(
            height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.grey))
      ],
    );
  }
}
