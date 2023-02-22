import 'package:order/features/cart/data/models/cart_items_model.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';

class GetCartDataUsecase {
  final CartReporisatoryInterface cartReporisatoryInterface;
  GetCartDataUsecase(this.cartReporisatoryInterface);

  Future<List<CartItemModel>> call() async {
    return await cartReporisatoryInterface.getCartData();
  }
}
