import 'package:flutter/material.dart';

enum Environment { DEV, PROD, TEST }

class AppConfig {
  static Environment env = Environment.DEV;
  static Uri backendBaseUrl = env == Environment.DEV
      ? Uri.parse("http://localhost:8080") // DEV
      : env == Environment.TEST
          ? Uri.parse("https://anyurl") // TEST
          : Uri.parse("https://linklist.cfapps.cool"); // PROD

  static String apiPath = "/api/v1";

  //static MaterialColor primary = Colors.blue;
  static MaterialColor primary = Colors.green;

  //static String version = "1.0.0";
  static String version = "1.0.1";
}
