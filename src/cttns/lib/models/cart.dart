import 'dart:io';

import 'package:cttns/models/product.dart';

class Cart {
  late int pId;
  late DateTime createdAt;
  late int quantity;
  late int customerId;
  late Product product;

  Cart(
      {required this.pId,
      required this.createdAt,
      required this.quantity,
      required this.customerId,
      required this.product});

  Cart.fromJson(Map<String, dynamic> json) {
    pId = json["pid"];
    createdAt = DateTime.parse(json["createdAt"]);
    quantity = json["quantity"];
    customerId = json["customerId"];
    product = Product.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "createdAt": createdAt.toString(),
        "quantity": quantity,
        "customerId": customerId,
        "product": product.toJson()
      };
}
