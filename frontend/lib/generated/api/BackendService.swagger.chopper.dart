// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BackendService.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$BackendService extends BackendService {
  _$BackendService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BackendService;

  @override
  Future<Response<LinkDto>> _apiV1LinksIdPut({
    required int? id,
    required UpdateLinkDto? body,
  }) {
    final Uri $url = Uri.parse('/api/v1/links/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LinkDto, LinkDto>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1LinksIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/v1/links/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiV1CategoriesIdPut({
    required int? id,
    required CategoryDto? body,
  }) {
    final Uri $url = Uri.parse('/api/v1/categories/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1CategoriesIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/v1/categories/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<LinkDto>>> _apiV1LinksGet() {
    final Uri $url = Uri.parse('/api/v1/links');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<LinkDto>, LinkDto>($request);
  }

  @override
  Future<Response<LinkDto>> _apiV1LinksPost({required CreateLinkDto? body}) {
    final Uri $url = Uri.parse('/api/v1/links');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LinkDto, LinkDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiV1CategoriesGet() {
    final Uri $url = Uri.parse('/api/v1/categories');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiV1CategoriesPost(
      {required CreateCategoryDto? body}) {
    final Uri $url = Uri.parse('/api/v1/categories');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<List<LinkDto>>> _apiV1LinksByTitleTitleGet(
      {required String? title}) {
    final Uri $url = Uri.parse('/api/v1/links/byTitle/${title}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<LinkDto>, LinkDto>($request);
  }

  @override
  Future<Response<LinkDto>> _apiV1LinksByIdIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/v1/links/byId/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<LinkDto, LinkDto>($request);
  }

  @override
  Future<Response<List<LinkDto>>> _apiV1LinksByCategoryIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/v1/links/byCategory/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<LinkDto>, LinkDto>($request);
  }

  @override
  Future<Response<List<CategoryDto>>> _apiV1CategoriesCachedGet() {
    final Uri $url = Uri.parse('/api/v1/categories/cached');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CategoryDto>, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiV1CategoriesByTitleTitleGet(
      {required String? title}) {
    final Uri $url = Uri.parse('/api/v1/categories/byTitle/${title}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiV1CategoriesByIdIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/v1/categories/byId/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }
}
