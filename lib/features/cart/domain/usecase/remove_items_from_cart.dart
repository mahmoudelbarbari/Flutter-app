import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

class RemoveItemsFromCartUsecase {
  final CartReporisatory cartReporisatory;

  RemoveItemsFromCartUsecase(this.cartReporisatory);

  Future<BaseResponse> call(CartEntity cartItems) async {
    return await cartReporisatory.removeItemsFromCart(cartItems);
  }
}
