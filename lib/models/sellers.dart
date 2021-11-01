// To parse this JSON data, do
//
//     final sellers = sellersFromJson(jsonString);

import 'dart:convert';

List<Sellers> sellersFromJson(String str) => List<Sellers>.from(json.decode(str).map((x) => Sellers.fromJson(x)));

String sellersToJson(List<Sellers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sellers {
  Sellers({
    this.id,
    this.preparationTime,
    this.discounted,
    this.category,
    this.name,
    this.devFee,
    this.rating,
    this.isOpen,
    this.rateCount,
    this.balance,
    this.img,
    this.income,
    this.discountPercent,
  });

  String id;
  String preparationTime;
  bool discounted;
  String category;
  String name;
  int devFee;
  int rating;
  bool isOpen;
  int rateCount;
  int balance;
  String img;
  int income;
  int discountPercent;

  factory Sellers.fromJson(Map<String, dynamic> json) => Sellers(
    id: json["id"],
    preparationTime: json["preparation_time"],
    discounted: json["discounted"],
    category: json["category"],
    name: json["name"],
    devFee: json["dev_fee"],
    rating: json["rating"],
    isOpen: json["is_open"],
    rateCount: json["rate_count"],
    balance: json["balance"],
    img: json["img"],
    income: json["income"],
    discountPercent: json["discount_percent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "preparation_time": preparationTime,
    "discounted": discounted,
    "category": category,
    "name": name,
    "dev_fee": devFee,
    "rating": rating,
    "is_open": isOpen,
    "rate_count": rateCount,
    "balance": balance,
    "img": img,
    "income": income,
    "discount_percent": discountPercent,
  };
}
