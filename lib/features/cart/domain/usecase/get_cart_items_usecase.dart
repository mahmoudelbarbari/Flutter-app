import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';

class GetCartItemsUsecase {
  final CartReporisatory cartReporisatory;

  GetCartItemsUsecase(this.cartReporisatory);

  Future<List<CartItemsEntity>> call() async {
    return await cartReporisatory.getCartItem();
  }
}
