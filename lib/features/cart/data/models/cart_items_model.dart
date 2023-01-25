import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order/features/cart/domain/entity/cart_entities.dart';

class CartItemsModel extends CartItemsEntity {
  CartItemsModel({
    String? productID,
    String? productName,
    num? price,
    int? quantity,
  }) : super(
          productID: productID,
          productName: productName,
          price: price,
          quantity: quantity,
        );

  factory CartItemsModel.fromMap(Map<String, dynamic> map) {
    return CartItemsModel(
      productID: map['productID'],
      productName: map['productName'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  factory CartItemsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return CartItemsModel(
      productID: documentSnapshot.data()!['productID'],
      productName: documentSnapshot.data()!['productName'],
      price: documentSnapshot.data()!['price'],
      quantity: documentSnapshot.data()!['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': productID,
      'productName': productName,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItemsModel.fromEntity(CartItemsEntity cartItemsEntity) =>
      CartItemsModel(
        productID: cartItemsEntity.productID,
        productName: cartItemsEntity.productName,
        price: cartItemsEntity.price,
        quantity: cartItemsEntity.quantity,
      );
}

class ItemsModel extends Items {
  ItemsModel(
    final String itemName,
    final double price,
  ) : super(
          itemName: itemName,
          price: price,
        );

  Map toJson() {
    return {
      'itemName': itemName,
      'price': price,
    };
  }
}
