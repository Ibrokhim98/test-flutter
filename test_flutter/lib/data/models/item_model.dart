import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String? object;
  int? id;
  String? name;
  int? price;
  String? currency;
  String? color;

  ItemModel({
    this.object,
    this.id,
    this.name,
    this.price,
    this.currency,
    this.color,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
