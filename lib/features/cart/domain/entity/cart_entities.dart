class CartItemsEntity {
  String? productID;
  String? productName;
  num? price;
  int? quantity;

  CartItemsEntity({
    this.productID,
    this.productName,
    this.price,
    this.quantity,
  });
}

class Items {
  final String itemName;
  final double price;

  Items({required this.itemName, required this.price});
}
