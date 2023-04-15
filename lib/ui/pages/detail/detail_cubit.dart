import 'package:bloc/bloc.dart';

import '../../../model/order.dart';
import '../../../repo/product_repository.dart';

abstract class IDetailViewState {
  final Order order;

  IDetailViewState(this.order);
}

class OrderUpdated extends IDetailViewState {
  OrderUpdated(super.order);
}

class DetailCubit extends Cubit<IDetailViewState> {
  IProductRepository _productRepository;
  Order order = Order("", "", "", 0);

  DetailCubit(this._productRepository)
      : super(OrderUpdated(Order("", "", "", 0)));

  void clearOrder() {
    order = Order("", "", "", 0);
    emit(OrderUpdated(order));
  }

  void updateColor(String selectedColor) {
    order.color = selectedColor;
    emit(OrderUpdated(order));
  }

  void updateSize(String selectedSize) {
    order.size = selectedSize;
    emit(OrderUpdated(order));
  }

  void updateAmount(int totalAmount) {
    order.amount = totalAmount;
    emit(OrderUpdated(order));
  }

  void increaseAmount() {
    order.amount = order.amount + 1;
    emit(OrderUpdated(order));
  }

  void decreaseAmount() {
    if (order.amount > 0) {
      order.amount = order.amount - 1;
    } else {
      order.amount = 0;
    }
    emit(OrderUpdated(order));
  }
}
