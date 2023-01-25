class CartEntity {
  final List<ProductEntity> items;
  final String id;
  final String itemName;
  final int totalQuantity;
  final String itemId;
  final double totalPrice;

  CartEntity(
    this.items,
    this.id,
    this.itemName,
    this.itemId,
    this.totalPrice,
    this.totalQuantity,
  );
}

class ProductEntity {
  final String id;
  final String name;
  final double price;
  final int quantity;

  ProductEntity(
    this.id,
    this.name,
    this.price,
    this.quantity,
  );
}
