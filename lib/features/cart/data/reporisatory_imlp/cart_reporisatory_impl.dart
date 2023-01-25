import 'package:order/features/cart/data/datasource/cart_datasource.dart';
import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

class CartReporisatoryImpl implements CartReporisatory {
  late CartItemsDatasource cartItemsDatasource;

  CartReporisatoryImpl(this.cartItemsDatasource);

  @override
  Future<List<CartItemsEntity>> getCartItem() async {
    return await cartItemsDatasource.getCartItems();
  }

  @override
  Future<BaseResponse> remoteAddCartItem(CartItemsEntity cartItemsEntity) {
    throw UnimplementedError();
  }
}
