import 'package:chopper/chopper.dart';

import '../../config/appConfig.dart';
import '../../generated/api/BackendService.swagger.dart';
import 'headerInterceptor.dart';

class BackendClient {
  static Future<BackendService> getNewClient() async {
    String token = "";

    return BackendService.create(
        baseUrl: AppConfig.backendBaseUrl,
        interceptors: [
          HeaderInterceptor(token: token),
          HttpLoggingInterceptor()
        ]);
  }
}
