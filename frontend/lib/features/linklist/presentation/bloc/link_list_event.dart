part of 'link_list_bloc.dart';

@immutable
abstract class LinkListEvent extends Equatable {
  @override
  List<Object> get props => [];

  const LinkListEvent();
}

class FetchLinksEvent extends LinkListEvent {
  const FetchLinksEvent();
}

class OpenLinkEvent extends LinkListEvent {
  final String url;

  @override
  List<Object> get props => [url];

  const OpenLinkEvent(this.url);
}

class ToggleEditModeEvent extends LinkListEvent {
  const ToggleEditModeEvent();
}

class TreeRenderedEvent extends LinkListEvent {
  const TreeRenderedEvent();
}

class UpdateCategoryEvent extends LinkListEvent {
  final String title;
  final int id;

  @override
  List<Object> get props => [title,id];

  const UpdateCategoryEvent(this.title,this.id);
}