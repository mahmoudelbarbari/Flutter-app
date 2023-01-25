import 'package:order/features/cart/data/datasource/cart_datasource.dart';
import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

class CartReporisatoryImpl implements CartReporisatory {
  late CartItemsDatasource cartItemsDatasource;

  CartReporisatoryImpl(this.cartItemsDatasource);

  @override
  Future<List<ProductEntity>> getAllProducts() {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> addItemTocart(ProductEntity product) {
    // TODO: implement addItemTocart
    throw UnimplementedError();
  }

  @override
  Future<void> decreaseQuantity(CartEntity cartItems) {
    // TODO: implement decreaseQuantity
    throw UnimplementedError();
  }

  @override
  Future<void> increaseQuantity(CartEntity cartItems) {
    // TODO: implement increaseQuantity
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> removeItemsFromCart(CartEntity cartItems) {
    // TODO: implement removeItemsFromCart
    throw UnimplementedError();
  }
}
