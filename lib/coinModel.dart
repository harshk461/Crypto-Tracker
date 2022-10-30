import 'package:flutter/material.dart';

class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.ImageURL,
    required this.price,
    required this.change,
    required this.percentage,
  });

  String name;
  String symbol;
  String ImageURL;
  num price;
  num change;
  num percentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      ImageURL: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      percentage: json['price_change_percentage_24h'],
    );
  }
}

List<Coin> coinList = [];
