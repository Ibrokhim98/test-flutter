import 'dart:convert';

import 'models/order_model.dart';

OrdersResponse ordersResponseFromJson(String str) =>
    OrdersResponse.fromJson(json.decode(str));

String ordersResponseToJson(OrdersResponse data) => json.encode(data.toJson());

class OrdersResponse {
  String object;
  List<OrderModel> orders;

  OrdersResponse({
    required this.object,
    required this.orders,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
        object: json["object"],
        orders: List<OrderModel>.from(
            json["orders"].map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}
