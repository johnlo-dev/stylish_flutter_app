import 'package:bloc/bloc.dart';
import 'package:flutter_project/repo/product_repository.dart';

import '../../../constants.dart';
import '../../../model/product.dart';

abstract class IHomeViewState {
  final HomeViewEntity homeViewEntity;

  IHomeViewState(this.homeViewEntity);
}

class ListUpdated extends IHomeViewState {
  ListUpdated(super.homeViewEntity);
}

class ApiFail extends IHomeViewState {
  ApiFail(super.homeViewEntity);
}

class HomeCubit extends Cubit<IHomeViewState> {
  final IProductRepository _productRepository;
  final HomeViewEntity homeViewEntity = HomeViewEntity([], [], [], [], "");

  HomeCubit(this._productRepository)
      : super(ListUpdated(HomeViewEntity([], [], [], [], "")));

  Future<void> fetchHomeProductLists() async {
    _handleProductListResponse(CategoryType.all, await _productRepository.fetchProductList(CategoryType.all));
    _handleProductListResponse(CategoryType.female, await _productRepository.fetchProductList(CategoryType.female));
    _handleProductListResponse(CategoryType.male, await _productRepository.fetchProductList(CategoryType.male));
    _handleProductListResponse(CategoryType.accessory, await _productRepository.fetchProductList(CategoryType.accessory));
  }

  void _handleProductListResponse(
      CategoryType type, ProductListResponse response) {
    if (response.code == StatusCode.success) {
      switch (type) {
        case CategoryType.all:
          homeViewEntity.bannerList = response.productList;
          break;
        case CategoryType.female:
          homeViewEntity.femaleList = response.productList;
          break;
        case CategoryType.male:
          homeViewEntity.maleList = response.productList;
          break;
        case CategoryType.accessory:
          homeViewEntity.accessoryList = response.productList;
          break;
      }
      emit(ListUpdated(homeViewEntity));
    } else {
      homeViewEntity.errorMessage = response.message.toString();
      emit(ApiFail(homeViewEntity));
    }
  }
}

class HomeViewEntity {
  List<Product> bannerList;
  List<Product> femaleList;
  List<Product> maleList;
  List<Product> accessoryList;

  String errorMessage;

  HomeViewEntity(this.bannerList, this.femaleList, this.maleList,
      this.accessoryList, this.errorMessage);

  factory HomeViewEntity.from(HomeViewEntity homeViewEntity) => HomeViewEntity(
      homeViewEntity.bannerList,
      homeViewEntity.femaleList,
      homeViewEntity.maleList,
      homeViewEntity.accessoryList,
      homeViewEntity.errorMessage);
}
