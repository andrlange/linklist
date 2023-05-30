// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LinkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkedEntity _$$_LinkedEntityFromJson(Map<String, dynamic> json) =>
    _$_LinkedEntity(
      id: json['id'] as int,
      category: json['category'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      support: json['support'] as bool,
      contact: json['contact'] as String,
      image: json['image'] as String,
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
      active: json['active'] as bool,
      categoryTitle: json['categoryTitle'] as String,
    );

Map<String, dynamic> _$$_LinkedEntityToJson(_$_LinkedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'url': instance.url,
      'description': instance.description,
      'support': instance.support,
      'contact': instance.contact,
      'image': instance.image,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'active': instance.active,
      'categoryTitle': instance.categoryTitle,
    };
