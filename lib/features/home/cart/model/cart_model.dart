import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.cart,
    this.price,
  });

  List<CartProducts>? cart;
  double? price;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cart: List<CartProducts>.from(
            json["cart"].map((x) => CartProducts.fromJson(x))),
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart!.map((x) => x.toJson())),
        "price": price,
      };
}

class CartProducts {
  CartProducts({
    this.id,
    this.brand,
    this.price,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
    this.count,
  });

  int? id;
  String? brand;
  double? price;
  String? photoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? count;

  factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
        id: json["id"],
        brand: json["brand"],
        price: json["price"].toDouble(),
        photoUrl: json["photo_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        count: 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "price": price,
        "photo_url": photoUrl,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "count": count,
      };
}
