import 'item_model.dart';

class OrderModel {
  String object;
  int id;
  String table;
  int guests;
  String date;
  List<ItemModel> items;

  OrderModel({
    required this.object,
    required this.id,
    required this.table,
    required this.guests,
    required this.date,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        object: json["object"],
        id: json["id"],
        table: json["table"],
        guests: json["guests"],
        date: json["date"],
        items: List<ItemModel>.from(
            json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "table": table,
        "guests": guests,
        "date": date,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);
  String get currency => items.isEmpty ? '' : items.first.currency;
}
