import 'dart:async';
import 'package:chopper/chopper.dart';

class HeaderInterceptor implements RequestInterceptor {
  final String token;
  final className = "HeaderInterceptor";

  static const AUTH_HEADER = "Authorization";
  static const BEARER = "Bearer ";
  static const CONTENT_TYPE = "content-type";
  static const ORIGIN = "Access-Control-Allow-Origin";

  HeaderInterceptor({required this.token});

  @override
  FutureOr<Request> onRequest(Request request) {
    //log("${request.baseUri} ${request.url}", name: className);
    const String contentType = "application/json; charset=utf-8";

    final Request newRequest = request.copyWith(
    //    headers: {AUTH_HEADER: BEARER + token, CONTENT_TYPE: contentType});
    headers: {ORIGIN: "*", CONTENT_TYPE: contentType});
    //log("header:${newRequest.headers.toString()}", name: className);

    return newRequest;
  }
}
