import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/services/locator.dart';
import 'package:frontend/features/linklist/domain/entities/CategoryEntity.dart';
import 'package:frontend/features/linklist/domain/entities/LinkEntity.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/services/DataService.dart';

part 'link_list_event.dart';
part 'link_list_state.dart';

class LinkListBloc extends Bloc<LinkListEvent, LinkListState> {
  DataService dataService = locator.get<DataService>();

  bool init = false;

  List<Widget> children = [];
  List<CategoryEntity> categories = [];
  List<LinkEntity> renderedEntities = [];

  TextEditingController textFieldController = TextEditingController();

  bool editMode = false;

  LinkListBloc() : super(const InitialLinkListState()) {
    on<LinkListEvent>((event, emit) {});

    on<FetchLinksEvent>((event, emit) => fetchLinks(emit));

    on<OpenLinkEvent>((event, emit) => openLink(emit, event));

    on<ToggleEditModeEvent>((event, emit) => toggleEditMode(emit, event));

    on<TreeRenderedEvent>((event, emit) => (emit(LoadingDoneState(children))));

    on<UpdateCategoryEvent>((event, emit) => updateCategory(emit, event));
  }

  Future<void> fetchLinks(Emitter emit) async {
    if(!init) {
      init = true;
      log("fetching Links", name: "LinkListBloc");
      List<LinkEntity> links = await dataService.fetchLinks();
      log("Links received #${links.length}", name: "LinkListBloc");
      children.clear();
      categories.clear();
      renderedEntities.clear();

      emit(LinkListReceivedLinks(links));
      log("emitted Links", name: "LinkListBloc");
    }
  }

  openLink(Emitter emit, OpenLinkEvent event) async {
    log("try to open: ${event.url}");
    final Uri url = Uri.parse(event.url);
    if (!await launchUrl(url)) {
      log('Could not launch $url');
    }
  }

  toggleEditMode(Emitter<LinkListState> emit, event) {
    editMode = !editMode;
    emit(LoadingState(renderedEntities));
    emit(EditModeChangeState(editMode));
  }

  @override
  Future<void> close() async {
    textFieldController.dispose();
    super.close();
  }

  updateCategory(Emitter<LinkListState> emit, UpdateCategoryEvent event)
  async {
    log("updating category: ${event.id}:${event.title}", name: "LinkListBloc");

    String title = event.title;
    int id = event.id;
    CategoryEntity entity = categories.firstWhere((element) => element.index == id);
    if(title != entity.title) {
      if(title.trim().isNotEmpty){
        CategoryEntity update = CategoryEntity(index: id, title: title.trim());
        emit(LoadingState(renderedEntities));

       await dataService.updateCategory(update);

        init = false;
        add(const FetchLinksEvent());
      }
    }
  }

}
