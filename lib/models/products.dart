// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productData,
    this.sellerData,
  });

  ProductData productData;
  SellerData sellerData;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productData: ProductData.fromJson(json["product_data"]),
    sellerData: SellerData.fromJson(json["seller_data"]),
  );

  Map<String, dynamic> toJson() => {
    "product_data": productData.toJson(),
    "seller_data": sellerData.toJson(),
  };
}

class ProductData {
  ProductData({
    this.category,
    this.condition,
    this.description,
    this.name,
    this.price,
    this.stock,
    this.variation,
  });

  String category;
  String condition;
  String description;
  String name;
  int price;
  int stock;
  Variation variation;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    category: json["category"],
    condition: json["condition"],
    description: json["description"],
    name: json["name"],
    price: json["price"],
    stock: json["stock"],
    variation: Variation.fromJson(json["variation"]),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "condition": condition,
    "description": description,
    "name": name,
    "price": price,
    "stock": stock,
    "variation": variation.toJson(),
  };
}

class Variation {
  Variation({
    this.size,
  });

  List<Size> size;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    size: List<Size>.from(json["size"].map((x) => Size.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "size": List<dynamic>.from(size.map((x) => x.toJson())),
  };
}

class Size {
  Size({
    this.name,
    this.price,
  });

  String name;
  int price;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
  };
}

class SellerData {
  SellerData({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory SellerData.fromJson(Map<String, dynamic> json) => SellerData(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
