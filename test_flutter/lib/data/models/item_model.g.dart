// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      object: json['object'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      currency: json['currency'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'color': instance.color,
    };
