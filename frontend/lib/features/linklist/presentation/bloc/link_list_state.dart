part of 'link_list_bloc.dart';

@immutable
abstract class LinkListState extends Equatable{
  @override
  List<Object> get props => [];

  const LinkListState();
}

class InitialLinkListState extends LinkListState {
  const InitialLinkListState();
}

class LoadingDoneState extends LinkListState {

  final List<Widget> children;

  @override
  List<Object> get props => [children];
  const LoadingDoneState(this.children);
}

class LoadingState extends LinkListState {

  final List<LinkEntity> links;

  @override
  List<Object> get props => [links];

  const LoadingState(this.links);
}

class LinkListReceivedLinks extends LinkListState {

  final List<LinkEntity> links;

  @override
  List<Object> get props => [links];

   const LinkListReceivedLinks(this.links);
}

class EditModeChangeState extends LinkListState {

  final bool editMode;

  @override
  List<Object> get props => [editMode];

  const EditModeChangeState(this.editMode);
}




