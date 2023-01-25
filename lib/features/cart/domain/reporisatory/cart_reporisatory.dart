import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

abstract class CartReporisatory {
  Future<BaseResponse> remoteAddCartItem(CartItemsEntity cartItemsEntity);
  Future<List<CartItemsEntity>> getCartItem();
}
