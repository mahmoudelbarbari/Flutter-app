import 'package:order/features/cart/data/models/cart_items_model.dart';

abstract class CartDataState {}

class CartDataStateInt extends CartDataState {}

class CartDataLoading extends CartDataState {}

class CartDataloaded extends CartDataState {
  final List<CartItemModel> cartModel;
  CartDataloaded({
    required this.cartModel,
  });
}

class CartDataError extends CartDataState {
  String errorMessage;
  CartDataError({required this.errorMessage});
}

class SuccessState extends CartDataState {
  SuccessState(dataAdded);
}
