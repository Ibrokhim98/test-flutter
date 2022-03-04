class ItemModel {
  String object;
  int id;
  String name;
  int price;
  String currency;
  String color;

  ItemModel({
    required this.object,
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.color,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        object: json["object"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        currency: json["currency"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "name": name,
        "price": price,
        "currency": currency,
        "color": color,
      };
}
