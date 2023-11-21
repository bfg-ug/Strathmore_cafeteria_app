// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  final List<OrderDetails> data;

  Order({
    required this.data,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        data: List<OrderDetails>.from(
            json["data"].map((x) => OrderDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderDetails {
  final int id;
  final String status;
  final String totalPrice;
  final int numberOfItems;
  final Customer customer;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderDetails({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.numberOfItems,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        id: json["id"],
        status: json["status"],
        totalPrice: json["total_price"],
        numberOfItems: json["number_of_items"],
        customer: Customer.fromJson(json["customer"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "total_price": totalPrice,
        "number_of_items": numberOfItems,
        "customer": customer.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Customer {
  final int id;
  final String firstName;
  final String lastName;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
      };
}
