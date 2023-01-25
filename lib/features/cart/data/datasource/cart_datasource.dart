import 'package:order/features/cart/data/models/cart_items_model.dart';

abstract class CartItemsDatasource {
  Future<List<CartItemsModel>> getCartItems();
}

class CartItemsDatasourceImpl implements CartItemsDatasource {
  @override
  Future<List<CartItemsModel>> getCartItems() async {
    List<CartItemsModel> products = [];
    return products;
  }
}
