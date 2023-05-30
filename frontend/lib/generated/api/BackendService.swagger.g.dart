// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BackendService.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLinkDto _$UpdateLinkDtoFromJson(Map<String, dynamic> json) =>
    UpdateLinkDto(
      id: json['id'] as int?,
      category: json['category'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      support: json['support'] as bool?,
      contact: json['contact'] as String?,
      image: json['image'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$UpdateLinkDtoToJson(UpdateLinkDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'url': instance.url,
      'description': instance.description,
      'support': instance.support,
      'contact': instance.contact,
      'image': instance.image,
      'active': instance.active,
    };

LinkDto _$LinkDtoFromJson(Map<String, dynamic> json) => LinkDto(
      id: json['id'] as int?,
      category: json['category'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      support: json['support'] as bool?,
      contact: json['contact'] as String?,
      image: json['image'] as String?,
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      active: json['active'] as bool?,
      categoryTitle: json['categoryTitle'] as String?,
    );

Map<String, dynamic> _$LinkDtoToJson(LinkDto instance) => <String, dynamic>{
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

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

CreateLinkDto _$CreateLinkDtoFromJson(Map<String, dynamic> json) =>
    CreateLinkDto(
      category: json['category'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      support: json['support'] as bool?,
      contact: json['contact'] as String?,
      image: json['image'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$CreateLinkDtoToJson(CreateLinkDto instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'url': instance.url,
      'description': instance.description,
      'support': instance.support,
      'contact': instance.contact,
      'image': instance.image,
      'active': instance.active,
    };

CreateCategoryDto _$CreateCategoryDtoFromJson(Map<String, dynamic> json) =>
    CreateCategoryDto(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CreateCategoryDtoToJson(CreateCategoryDto instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
