// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;

part 'BackendService.swagger.chopper.dart';
part 'BackendService.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class BackendService extends ChopperService {
  static BackendService create({
    ChopperClient? client,
    Authenticator? authenticator,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$BackendService(client);
    }

    final newClient = ChopperClient(
        services: [_$BackendService()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$BackendService(newClient);
  }

  ///
  ///@param id
  Future<chopper.Response<LinkDto>> apiV1LinksIdPut({
    required int? id,
    required UpdateLinkDto? body,
  }) {
    generatedMapping.putIfAbsent(LinkDto, () => LinkDto.fromJsonFactory);

    return _apiV1LinksIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/v1/links/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<LinkDto>> _apiV1LinksIdPut({
    @Path('id') required int? id,
    @Body() required UpdateLinkDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> apiV1LinksIdDelete({required int? id}) {
    return _apiV1LinksIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/v1/links/{id}')
  Future<chopper.Response> _apiV1LinksIdDelete({@Path('id') required int? id});

  ///Updates a category by id and its new title
  ///@param id The category id
  Future<chopper.Response<CategoryDto>> apiV1CategoriesIdPut({
    required int? id,
    required CategoryDto? body,
  }) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiV1CategoriesIdPut(id: id, body: body);
  }

  ///Updates a category by id and its new title
  ///@param id The category id
  @Put(
    path: '/api/v1/categories/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<CategoryDto>> _apiV1CategoriesIdPut({
    @Path('id') required int? id,
    @Body() required CategoryDto? body,
  });

  ///Delete a category by id
  ///@param id The category id
  Future<chopper.Response> apiV1CategoriesIdDelete({required int? id}) {
    return _apiV1CategoriesIdDelete(id: id);
  }

  ///Delete a category by id
  ///@param id The category id
  @Delete(path: '/api/v1/categories/{id}')
  Future<chopper.Response> _apiV1CategoriesIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<LinkDto>>> apiV1LinksGet() {
    generatedMapping.putIfAbsent(LinkDto, () => LinkDto.fromJsonFactory);

    return _apiV1LinksGet();
  }

  ///
  @Get(path: '/api/v1/links')
  Future<chopper.Response<List<LinkDto>>> _apiV1LinksGet();

  ///
  Future<chopper.Response<LinkDto>> apiV1LinksPost(
      {required CreateLinkDto? body}) {
    generatedMapping.putIfAbsent(LinkDto, () => LinkDto.fromJsonFactory);

    return _apiV1LinksPost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/links',
    optionalBody: true,
  )
  Future<chopper.Response<LinkDto>> _apiV1LinksPost(
      {@Body() required CreateLinkDto? body});

  ///Retrieves all categories
  Future<chopper.Response<CategoryDto>> apiV1CategoriesGet() {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiV1CategoriesGet();
  }

  ///Retrieves all categories
  @Get(path: '/api/v1/categories')
  Future<chopper.Response<CategoryDto>> _apiV1CategoriesGet();

  ///Creates a category with a given title
  Future<chopper.Response<CategoryDto>> apiV1CategoriesPost(
      {required CreateCategoryDto? body}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiV1CategoriesPost(body: body);
  }

  ///Creates a category with a given title
  @Post(
    path: '/api/v1/categories',
    optionalBody: true,
  )
  Future<chopper.Response<CategoryDto>> _apiV1CategoriesPost(
      {@Body() required CreateCategoryDto? body});

  ///
  ///@param title
  Future<chopper.Response<List<LinkDto>>> apiV1LinksByTitleTitleGet(
      {required String? title}) {
    generatedMapping.putIfAbsent(LinkDto, () => LinkDto.fromJsonFactory);

    return _apiV1LinksByTitleTitleGet(title: title);
  }

  ///
  ///@param title
  @Get(path: '/api/v1/links/byTitle/{title}')
  Future<chopper.Response<List<LinkDto>>> _apiV1LinksByTitleTitleGet(
      {@Path('title') required String? title});

  ///
  ///@param id
  Future<chopper.Response<LinkDto>> apiV1LinksByIdIdGet({required int? id}) {
    generatedMapping.putIfAbsent(LinkDto, () => LinkDto.fromJsonFactory);

    return _apiV1LinksByIdIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/v1/links/byId/{id}')
  Future<chopper.Response<LinkDto>> _apiV1LinksByIdIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<List<LinkDto>>> apiV1LinksByCategoryIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(LinkDto, () => LinkDto.fromJsonFactory);

    return _apiV1LinksByCategoryIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/v1/links/byCategory/{id}')
  Future<chopper.Response<List<LinkDto>>> _apiV1LinksByCategoryIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<CategoryDto>>> apiV1CategoriesCachedGet() {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiV1CategoriesCachedGet();
  }

  ///
  @Get(path: '/api/v1/categories/cached')
  Future<chopper.Response<List<CategoryDto>>> _apiV1CategoriesCachedGet();

  ///Retrieves a category by title
  ///@param title The category title
  Future<chopper.Response<CategoryDto>> apiV1CategoriesByTitleTitleGet(
      {required String? title}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiV1CategoriesByTitleTitleGet(title: title);
  }

  ///Retrieves a category by title
  ///@param title The category title
  @Get(path: '/api/v1/categories/byTitle/{title}')
  Future<chopper.Response<CategoryDto>> _apiV1CategoriesByTitleTitleGet(
      {@Path('title') required String? title});

  ///Retrieves a category by id
  ///@param id The category id
  Future<chopper.Response<CategoryDto>> apiV1CategoriesByIdIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiV1CategoriesByIdIdGet(id: id);
  }

  ///Retrieves a category by id
  ///@param id The category id
  @Get(path: '/api/v1/categories/byId/{id}')
  Future<chopper.Response<CategoryDto>> _apiV1CategoriesByIdIdGet(
      {@Path('id') required int? id});
}

@JsonSerializable(explicitToJson: true)
class UpdateLinkDto {
  UpdateLinkDto({
    this.id,
    this.category,
    this.title,
    this.url,
    this.description,
    this.support,
    this.contact,
    this.image,
    this.active,
  });

  factory UpdateLinkDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateLinkDtoFromJson(json);

  static const toJsonFactory = _$UpdateLinkDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateLinkDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'category')
  final int? category;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'support')
  final bool? support;
  @JsonKey(name: 'contact')
  final String? contact;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$UpdateLinkDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateLinkDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.support, support) ||
                const DeepCollectionEquality()
                    .equals(other.support, support)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(support) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $UpdateLinkDtoExtension on UpdateLinkDto {
  UpdateLinkDto copyWith(
      {int? id,
      int? category,
      String? title,
      String? url,
      String? description,
      bool? support,
      String? contact,
      String? image,
      bool? active}) {
    return UpdateLinkDto(
        id: id ?? this.id,
        category: category ?? this.category,
        title: title ?? this.title,
        url: url ?? this.url,
        description: description ?? this.description,
        support: support ?? this.support,
        contact: contact ?? this.contact,
        image: image ?? this.image,
        active: active ?? this.active);
  }

  UpdateLinkDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? category,
      Wrapped<String?>? title,
      Wrapped<String?>? url,
      Wrapped<String?>? description,
      Wrapped<bool?>? support,
      Wrapped<String?>? contact,
      Wrapped<String?>? image,
      Wrapped<bool?>? active}) {
    return UpdateLinkDto(
        id: (id != null ? id.value : this.id),
        category: (category != null ? category.value : this.category),
        title: (title != null ? title.value : this.title),
        url: (url != null ? url.value : this.url),
        description:
            (description != null ? description.value : this.description),
        support: (support != null ? support.value : this.support),
        contact: (contact != null ? contact.value : this.contact),
        image: (image != null ? image.value : this.image),
        active: (active != null ? active.value : this.active));
  }
}

@JsonSerializable(explicitToJson: true)
class LinkDto {
  LinkDto({
    this.id,
    this.category,
    this.title,
    this.url,
    this.description,
    this.support,
    this.contact,
    this.image,
    this.likes,
    this.dislikes,
    this.active,
    this.categoryTitle,
  });

  factory LinkDto.fromJson(Map<String, dynamic> json) =>
      _$LinkDtoFromJson(json);

  static const toJsonFactory = _$LinkDtoToJson;
  Map<String, dynamic> toJson() => _$LinkDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'category')
  final int? category;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'support')
  final bool? support;
  @JsonKey(name: 'contact')
  final String? contact;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'likes')
  final int? likes;
  @JsonKey(name: 'dislikes')
  final int? dislikes;
  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'categoryTitle')
  final String? categoryTitle;
  static const fromJsonFactory = _$LinkDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LinkDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.support, support) ||
                const DeepCollectionEquality()
                    .equals(other.support, support)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.dislikes, dislikes) ||
                const DeepCollectionEquality()
                    .equals(other.dislikes, dislikes)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.categoryTitle, categoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.categoryTitle, categoryTitle)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(support) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(dislikes) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(categoryTitle) ^
      runtimeType.hashCode;
}

extension $LinkDtoExtension on LinkDto {
  LinkDto copyWith(
      {int? id,
      int? category,
      String? title,
      String? url,
      String? description,
      bool? support,
      String? contact,
      String? image,
      int? likes,
      int? dislikes,
      bool? active,
      String? categoryTitle}) {
    return LinkDto(
        id: id ?? this.id,
        category: category ?? this.category,
        title: title ?? this.title,
        url: url ?? this.url,
        description: description ?? this.description,
        support: support ?? this.support,
        contact: contact ?? this.contact,
        image: image ?? this.image,
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
        active: active ?? this.active,
        categoryTitle: categoryTitle ?? this.categoryTitle);
  }

  LinkDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? category,
      Wrapped<String?>? title,
      Wrapped<String?>? url,
      Wrapped<String?>? description,
      Wrapped<bool?>? support,
      Wrapped<String?>? contact,
      Wrapped<String?>? image,
      Wrapped<int?>? likes,
      Wrapped<int?>? dislikes,
      Wrapped<bool?>? active,
      Wrapped<String?>? categoryTitle}) {
    return LinkDto(
        id: (id != null ? id.value : this.id),
        category: (category != null ? category.value : this.category),
        title: (title != null ? title.value : this.title),
        url: (url != null ? url.value : this.url),
        description:
            (description != null ? description.value : this.description),
        support: (support != null ? support.value : this.support),
        contact: (contact != null ? contact.value : this.contact),
        image: (image != null ? image.value : this.image),
        likes: (likes != null ? likes.value : this.likes),
        dislikes: (dislikes != null ? dislikes.value : this.dislikes),
        active: (active != null ? active.value : this.active),
        categoryTitle:
            (categoryTitle != null ? categoryTitle.value : this.categoryTitle));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  CategoryDto({
    this.id,
    this.title,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  static const toJsonFactory = _$CategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  static const fromJsonFactory = _$CategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $CategoryDtoExtension on CategoryDto {
  CategoryDto copyWith({int? id, String? title}) {
    return CategoryDto(id: id ?? this.id, title: title ?? this.title);
  }

  CategoryDto copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? title}) {
    return CategoryDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateLinkDto {
  CreateLinkDto({
    this.category,
    this.title,
    this.url,
    this.description,
    this.support,
    this.contact,
    this.image,
    this.active,
  });

  factory CreateLinkDto.fromJson(Map<String, dynamic> json) =>
      _$CreateLinkDtoFromJson(json);

  static const toJsonFactory = _$CreateLinkDtoToJson;
  Map<String, dynamic> toJson() => _$CreateLinkDtoToJson(this);

  @JsonKey(name: 'category')
  final int? category;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'support')
  final bool? support;
  @JsonKey(name: 'contact')
  final String? contact;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$CreateLinkDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateLinkDto &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.support, support) ||
                const DeepCollectionEquality()
                    .equals(other.support, support)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(support) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $CreateLinkDtoExtension on CreateLinkDto {
  CreateLinkDto copyWith(
      {int? category,
      String? title,
      String? url,
      String? description,
      bool? support,
      String? contact,
      String? image,
      bool? active}) {
    return CreateLinkDto(
        category: category ?? this.category,
        title: title ?? this.title,
        url: url ?? this.url,
        description: description ?? this.description,
        support: support ?? this.support,
        contact: contact ?? this.contact,
        image: image ?? this.image,
        active: active ?? this.active);
  }

  CreateLinkDto copyWithWrapped(
      {Wrapped<int?>? category,
      Wrapped<String?>? title,
      Wrapped<String?>? url,
      Wrapped<String?>? description,
      Wrapped<bool?>? support,
      Wrapped<String?>? contact,
      Wrapped<String?>? image,
      Wrapped<bool?>? active}) {
    return CreateLinkDto(
        category: (category != null ? category.value : this.category),
        title: (title != null ? title.value : this.title),
        url: (url != null ? url.value : this.url),
        description:
            (description != null ? description.value : this.description),
        support: (support != null ? support.value : this.support),
        contact: (contact != null ? contact.value : this.contact),
        image: (image != null ? image.value : this.image),
        active: (active != null ? active.value : this.active));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateCategoryDto {
  CreateCategoryDto({
    this.title,
  });

  factory CreateCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDtoFromJson(json);

  static const toJsonFactory = _$CreateCategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CreateCategoryDtoToJson(this);

  @JsonKey(name: 'title')
  final String? title;
  static const fromJsonFactory = _$CreateCategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateCategoryDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^ runtimeType.hashCode;
}

extension $CreateCategoryDtoExtension on CreateCategoryDto {
  CreateCategoryDto copyWith({String? title}) {
    return CreateCategoryDto(title: title ?? this.title);
  }

  CreateCategoryDto copyWithWrapped({Wrapped<String?>? title}) {
    return CreateCategoryDto(title: (title != null ? title.value : this.title));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
