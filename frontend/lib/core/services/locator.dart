import 'dart:developer';

import 'package:frontend/core/services/DataService.dart';
import 'package:get_it/get_it.dart';


final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  log('setting up locator', name: 'Locator');
  locator.registerSingleton<DataService>(DataService());
}
