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