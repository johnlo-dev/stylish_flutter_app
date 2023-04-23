import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/model/order.dart';
import 'package:flutter_project/ui/general_widgets/vertical_spacer.dart';
import 'package:flutter_project/ui/pages/detail/detail_cubit.dart';

import '../../../constants.dart';
import '../../../model/product.dart';
import '../../general_widgets/stylish_header.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required Product product, required Order order})
      : _order = order,
        _product = product;

  final Order _order;
  final Product _product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<DetailCubit, IDetailViewState>(
                builder: (context, state) {

              final isCardInfoValid = state.order.primeResult.isNotEmpty &&
                  !state.order.primeResult.startsWith("error");
              print("123456/" + state.order.primeResult );

              return Padding(
                  padding: const EdgeInsets.all(Dimens.paddingGeneral),
                  child: Column(children: [
                    StylishHeader(hasIcBack: true),
                    const VerticalSpacer(spacerHeight: Dimens.paddingGeneral),
                    getOrderDetailSection(),
                    const VerticalSpacer(spacerHeight: Dimens.paddingGeneral),
                    SizedBox(
                      width: double.infinity,
                      height: Dimens.heightSizeSelectorButton,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            backgroundColor: Colors.black54),
                        onPressed: () {
                          context.read<DetailCubit>().startPay();
                        },
                        child: const Text(Strings.cartEnterCardInfo),
                      ),
                    ),
                    const VerticalSpacer(spacerHeight: Dimens.paddingGeneral),
                    Text(
                        state.order.primeResult.isEmpty
                            ? ""
                            : isCardInfoValid
                                ? "${Strings.cartEnterCardInfoSuccess}\nprime = ${_order.primeResult}"
                                : "${Strings.cartEnterCardInfoFailed}\n${_order.primeResult}",
                        style: TextStyle(
                            color:
                                isCardInfoValid ? Colors.black : Colors.red)),
                    const VerticalSpacer(spacerHeight: Dimens.paddingDouble),
                    Visibility(
                      visible: isCardInfoValid,
                      child: SizedBox(
                        width: double.infinity,
                        height: Dimens.heightSizeSelectorButton,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              backgroundColor: Colors.black54),
                          onPressed: () {
                            context.read<DetailCubit>().clearOrder();
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(Strings.cartPaymentSuccess),
                            ));
                          },
                          child: const Text(Strings.cartConfirmPayment),
                        ),
                      ),
                    ),
                  ]));
            })));
  }

  Widget getOrderDetailSection() {
    return SizedBox(
        height: Dimens.heightMainProduct,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              _product.mainImage,
              width: Dimens.widthMainProductImage,
              fit: BoxFit.cover,
            ),
            Expanded(
                // to make text width flexible without overflow
                child: Padding(
                    padding: const EdgeInsets.all(Dimens.paddingHalf),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_product.title),
                          Text(_product.id.toString()),
                          Text("${Strings.detailTitleColor} | ${_order.color}"),
                          Text("${Strings.detailTitleSize} | ${_order.size}"),
                        ]))),
            Expanded(
                // to make text width flexible without overflow
                child: Padding(
                    padding: const EdgeInsets.all(Dimens.paddingHalf),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "${Strings.cartTitlePriceSingle}${_product.price}"),
                          Text("${Strings.cartTitleAmount}${_order.amount}"),
                          Text(
                              "${Strings.cartTitlePriceTotal}${_product.price * _order.amount}"),
                        ])))
          ],
        ));
  }
}
