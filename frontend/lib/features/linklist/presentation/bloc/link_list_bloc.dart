import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/core/services/locator.dart';
import 'package:frontend/features/linklist/domain/entities/LinkEntity.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/DataService.dart';

part 'link_list_event.dart';
part 'link_list_state.dart';

class LinkListBloc extends Bloc<LinkListEvent, LinkListState> {

  DataService dataService = locator.get<DataService>();

  bool init = false;

  LinkListBloc() : super(const InitialLinkListState()) {
    on<LinkListEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchLinksEvent>((event, emit) => fetchLinks(emit)
    );
  }

  Future<void> fetchLinks(Emitter emit) async {
    init = true;
    log("fetching Links");
    List<LinkEntity> links = await dataService.fetchLinks();
    log("Links received");
    emit(LinkListReceivedLinks(links));
  }
}
