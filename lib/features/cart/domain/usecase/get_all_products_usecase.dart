import 'package:order/features/cart/domain/entity/cart_entities.dart';
import 'package:order/features/cart/domain/reporisatory/cart_reporisatory.dart';

class GetAllProductsUsecase {
  final CartReporisatory cartReporisatory;

  GetAllProductsUsecase(this.cartReporisatory);
  Future<List<ProductEntity>> call() async {
    return await cartReporisatory.getAllProducts();
  }
}
