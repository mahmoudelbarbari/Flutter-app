import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

abstract class CartReporisatory {
  Future<List<ProductEntity>> getAllProducts();
  Future<BaseResponse> addItemTocart(ProductEntity product);
  Future<BaseResponse> removeItemsFromCart(CartEntity cartItems);
  Future<void> decreaseQuantity(CartEntity cartItems);
  Future<void> increaseQuantity(CartEntity cartItems);
}
