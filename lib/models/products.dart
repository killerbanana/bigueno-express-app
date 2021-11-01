// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';
import 'package:get/state_manager.dart';
List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.productData,
    this.sellerData,
  });

  ProductData productData;
  SellerData sellerData;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
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
    this.condition,
    this.image,
    this.rating,
    this.name,
    this.variation,
    this.description,
    this.stock,
    this.category,
    this.price,
    this.id,
  });

  String condition;
  String image;
  String rating;
  String name;
  Variation variation;
  String description;
  int stock;
  String category;
  int price;
  String id;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    condition: json["condition"],
    image: json["image"],
    rating: json["rating"],
    name: json["name"],
    variation: Variation.fromJson(json["variation"]),
    description: json["description"],
    stock: json["stock"],
    category: json["category"],
    price: json["price"],
    id: json["id"],
  );

  var isFavorite = false.obs;

  Map<String, dynamic> toJson() => {
    "condition": condition,
    "image": image,
    "rating": rating,
    "name": name,
    "variation": variation.toJson(),
    "description": description,
    "stock": stock,
    "category": category,
    "price": price,
    "id": id,
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
    this.name,
  });

  String name;

  factory SellerData.fromJson(Map<String, dynamic> json) => SellerData(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
