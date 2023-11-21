// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  final List<Datum> data;

  Food({
    required this.data,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String name;
  final String imagepath;
  final String price;
  final dynamic quantity;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.imagepath,
    required this.price,
    required this.quantity,
    required this.updatedAt,
  });

  String get _name => name;

  String get _price => price;

  String get _imagepath => imagepath;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["title"],
        imagepath: json["image_url"],
        price: json["price"],
        quantity: json["quantity"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": name,
        "image_url": imagepath,
        "price": price,
        "quantity": quantity,
        "updated_at": updatedAt.toIso8601String(),
      };
}
