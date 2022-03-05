import 'package:json_annotation/json_annotation.dart';
import 'models/order_model.dart';

part 'orders_response.g.dart';

@JsonSerializable()
class OrdersResponse {
  String? object;
  List<OrderModel>? orders;

  OrdersResponse({
    this.object,
    this.orders,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}
