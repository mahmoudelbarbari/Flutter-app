import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/features/cart/data/models/cart_items_model.dart';
import 'package:order/features/cart/domain/usecase/add_cart_data_usecase.dart';
import 'package:order/features/cart/domain/usecase/get_cart_data_usecase.dart';
import 'package:order/features/cart/presentation/cubit/cart_data_state.dart';
import 'package:order/injection_container.dart';

class CartDataCubit extends Cubit<CartDataState> {
  late GetCartDataUsecase getCartDataUsecase;
  late AddCartData addCartData;
  CartDataCubit() : super(CartDataStateInt());

  Future<void> getData() async {
    try {
      emit(CartDataLoading());
      getCartDataUsecase = sl();
      final getData = await getCartDataUsecase.call();
      emit(CartDataloaded(cartModel: getData));
    } catch (e) {
      emit(CartDataError(errorMessage: e.toString()));
    }
  }

  //   Future<void> addProductToCart(MenuModel menuModel) async {
  //   try {
  //     addProductToCartUsecase = sl();
  //     final addedCartItem = await addProductToCartUsecase.call(menuModel);
  //     if (addedCartItem.status) {
  //       emit(CartSuccess(addedCartItem));
  //     } else {
  //       emit(CartError(errorMessage: addedCartItem.message));
  //     }
  //   } catch (e) {
  //     emit(CartError(errorMessage: e.toString()));
  //   }
  // }

  Future<void> addDataToCheckList(CartItemModel cartItemModel) async {
    try {
      addCartData = sl();
      final dataAdd = await addCartData.call(cartItemModel);
      if (dataAdd.status) {
        emit(SuccessState(dataAdd));
      } else {
        emit(CartDataError(errorMessage: dataAdd.message));
      }
    } catch (e) {
      emit(CartDataError(errorMessage: e.toString()));
    }
  }
}
