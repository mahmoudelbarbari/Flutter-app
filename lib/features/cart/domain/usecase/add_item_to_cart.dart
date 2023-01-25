import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';
import 'package:order/features/event/domain/entities/event_entities.dart';

class AddItemToCartUsecase {
  final CartReporisatory cartReporisatory;

  AddItemToCartUsecase(this.cartReporisatory);

  Future<BaseResponse> call(ProductEntity product) async {
    return await cartReporisatory.addItemTocart(product);
  }
}
