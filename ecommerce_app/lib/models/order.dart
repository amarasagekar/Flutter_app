// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_app/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantity;
  final String address;
  final String userId;
  final int orderedAt;
  final int status;

  Order(this.id, this.products, this.quantity, this.address, this.userId,
      this.orderedAt, this.status);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'address': address,
      'userId': userId,
      'orderedAt': orderedAt,
      'status': status,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      map['_id'] as String,
      List<Product>.from(
        map['products']?.map<Product>(
          (x) => Product.fromMap(x['product']),
        ),
      ),
      List<int>.from(map['products']?.map((x) => x['quantity'])),
      map['address'] as String,
      map['userId'] as String,
      map['orderedAt'] as int,
      map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
