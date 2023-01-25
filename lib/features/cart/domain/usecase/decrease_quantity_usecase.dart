import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';

class DecreaseQuantityUsecase {
  final CartReporisatory cartReporisatory;

  DecreaseQuantityUsecase(this.cartReporisatory);

  Future<void> call(CartEntity cartItems) async {
    return await cartReporisatory.decreaseQuantity(cartItems);
  }
}
