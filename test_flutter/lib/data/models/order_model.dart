import 'package:json_annotation/json_annotation.dart';
import 'item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String? object;
  int? id;
  String? table;
  int? guests;
  String? date;
  List<ItemModel>? items;

  OrderModel({
    this.object,
    this.id,
    this.table,
    this.guests,
    this.date,
    this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromMap(Map<String, dynamic> map) => OrderModel(
        object: map['object'] as String?,
        id: map['id'] as int?,
        table: map['table'] as String?,
        guests: map['guests'] as int?,
        date: map['date'] as String?,
        items: (map['items'] as List<dynamic>?)
            ?.map((e) => ItemModel.fromJson((e as Map).cast<String, dynamic>()))
            .toList(),
      );

  int? get totalPrice => items?.map((e) => e.price).reduce((a, b) => a! + b!);
  String get currency => items == null ? '' : items?.first.currency ?? '';
}
