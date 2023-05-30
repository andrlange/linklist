part of 'link_list_bloc.dart';

@immutable
abstract class LinkListState extends Equatable{
  @override
  List<Object> get props => [];

  const LinkListState();
}

class InitialLinkListState extends LinkListState {

  @override
  List<Object> get props => [];
  const InitialLinkListState();
}

class LinkListReceivedLinks extends LinkListState {

  final List<LinkEntity> links;

  @override
  List<Object> get props => [links];

   const LinkListReceivedLinks(this.links);
}




