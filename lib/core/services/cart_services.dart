import 'package:order/features/cart/data/models/cart_items_model.dart';

class CartService {
  final List<CartItemsModel> cartProducts = [];

  final deliveryFee = 10.0;

  int quantity = 1;

  productQuantity(cartProducts) {
    var quantity = {};
    cartProducts.forEach((cartProduct) {
      if (!quantity.containsKey(cartProduct)) {
        quantity[cartProduct] = 1;
      } else {
        quantity[cartProduct] += 1;
      }
    });
    return quantity;
  }

  addProduct(CartItemsModel cartProduct) {
    cartProducts.add(cartProduct);
  }

  removeItem(CartItemsModel cartProduct) {
    cartProducts.removeWhere((x) => x == cartProduct);
  }

  void clear() {
    cartProducts.clear();
  }

  double getSubTotal() {
    return cartProducts
        .map((e) => e.price)
        .fold(0, (price1, price2) => price1 + price2!);
  }

  double getTotal() {
    return cartProducts
        .map((e) => e.price)
        .fold(deliveryFee, (price1, price2) => price1 + price2!);
  }

  decreaseQuantity(CartItemsModel cartProduct) {
    cartProducts.remove(cartProduct);
  }
}
