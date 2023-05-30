import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:frontend/features/linklist/domain/entities/LinkEntity.dart';
import 'package:frontend/generated/api/BackendService.swagger.dart';

import '../network/backendClient.dart';
import '../util/DtoEntityUtil.dart';

class DataService {
  final String className = "DataService";


  Future<List<LinkEntity>> fetchLinks() async {
    final List<LinkEntity> links = [];


    final backendClient = await BackendClient.getNewClient();
    final getResult = await backendClient.apiV1LinksGet();


    if (getResult.isSuccessful) {
      final List<LinkDto>? body = getResult.body;
      if (body != null) {
        for (var element in body) {
          debugPrint("received element: $element name:$className");
          links.add(DtoEntityUtil.dtoToEntity(element));

          log("link:${links.elementAt(links.length - 1).toString()}",
              name: className);
        }
        log("result status:${getResult.statusCode}", name: className);
      }
    } else {
      log("result error:${getResult.statusCode}", name: className);
    }

    links.sort((a, b) => a.category.compareTo(b.category));
    return links;
  }

}