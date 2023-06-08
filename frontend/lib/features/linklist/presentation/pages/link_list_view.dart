import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:frontend/config/appConfig.dart';
import 'package:frontend/features/linklist/domain/entities/CategoryEntity.dart';
import 'package:frontend/features/linklist/domain/entities/LinkEntity.dart';
import 'package:frontend/features/linklist/presentation/bloc/link_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/text_styling.dart';
import '../../../../features/settings/settings_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LinkListBloc(),
      child: BlocConsumer<LinkListBloc, LinkListState>(
        listener: (context, state) {
          LinkListBloc bloc = BlocProvider.of<LinkListBloc>(context);

          bool render = false;

          List<LinkEntity> links = [];
          if (state is LinkListReceivedLinks) {
            links = state.links;
            render = true;
          } else if (state is LoadingState) {
            links = state.links;
            render = true;
          }

          if (render) {
            dev.log("received links", name: "LinkListView");

            bloc.children.clear();
            bloc.categories.clear();

            for (int i = 0; i < links.length; i++) {
              CategoryEntity category = CategoryEntity(
                  index: links[i].category, title: links[i].categoryTitle);

              if (!bloc.categories.contains(category)) {
                dev.log("add category: $category editMode:${bloc.editMode}",
                    name: "LinkListView");
                bloc.categories.add(category);

                bloc.children.add(Container(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50.0, bottom: 20.0, top: 20.0),
                  child: Material(
                    child: ListTile(
                      title:
                          Text(category.title, style: AppStyles.categoryTitle),
                      tileColor: Theme.of(context).primaryColor,
                      trailing: bloc.editMode
                          ? IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      bloc.textFieldController.text =
                                          category.title;
                                      return AlertDialog(
                                        title: const Text('Title'),
                                        content: TextField(
                                          controller: bloc.textFieldController,
                                          decoration: const InputDecoration(
                                            labelText: 'Enter a Title',
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Submit'),
                                            onPressed: () {
                                              String textValue =
                                                  bloc.textFieldController.text;
                                              // Do something with the text value
                                              Navigator.of(context).pop();
                                              bloc.add(UpdateCategoryEvent(
                                                bloc.textFieldController.text,
                                                category.index,
                                              ));
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                            )
                          : null,
                    ),
                  ),
                ));
              }

              if (!bloc.renderedEntities.contains(links[i])) {
                bloc.renderedEntities.add(links[i]);
              }
              // Add Link
              bloc.children.add(Container(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50.0, bottom: 20.0, top: 20.0),
                  child: ListTile(
                    leading: (links[i].image.isNotEmpty)
                        ? Image.memory(
                            base64Decode(links[i].image),
                            width: 120.0,
                          )
                        : null,
                    title: Text(
                      links[i].title,
                      style: AppStyles.linkTitle,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          links[i].description,
                          style: AppStyles.linkContent,
                        ),
                        const SizedBox(height: 4.0),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () =>
                                  {bloc.add(OpenLinkEvent(links[i].url))},
                              child: Text(
                                links[i].url,
                                style: AppStyles.linkUrl,
                              )),
                        ),
                      ],
                    ),
                  )));
            }
          }
          dev.log("created widget tree with #${bloc.children.length} elements",
              name: "LinkListView");
          bloc.add(const TreeRenderedEvent());
        },
        builder: (context, state) {
          LinkListBloc bloc = BlocProvider.of<LinkListBloc>(context);

          bool loading = true;

          if (!bloc.init) {
            bloc.add(const FetchLinksEvent());
          }

          List<Widget> children = [];
          if (state is LoadingDoneState) {
            loading = false;
            children = state.children;
            dev.log("loading done", name: "LinkListView");
          }

          if (state is LoadingState) {
            loading = true;
          }

          bool editMode = bloc.editMode;
          if (state is EditModeChangeState) {
            editMode = state.editMode;
            loading = false;
          }

          dev.log(
              "rendering widget tree with #${children.length} elements -"
              " loading: $loading editMode: $editMode",
              name: "LinkListView");

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Links - Version: ${AppConfig.version}',
                style: AppStyles.appTitle,
              ),
              actions: [
                IconButton(
                  icon: editMode
                      ? const Icon(Icons.cancel)
                      : const Icon(Icons.edit),
                  onPressed: () {
                    bloc.add(const ToggleEditModeEvent());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
            ),
            body: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (context, index) => children[index],
                  ),
          );
        },
      ),
    );
  }
}
