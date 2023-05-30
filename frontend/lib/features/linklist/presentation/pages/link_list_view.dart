import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/features/linklist/domain/entities/LinkEntity.dart';
import 'package:frontend/features/linklist/presentation/bloc/link_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/DataService.dart';
import '../../../../core/services/locator.dart';
import '../../../../src/settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LinkListBloc(),
      child: BlocBuilder<LinkListBloc, LinkListState>(
        builder: (context, state) {
          LinkListBloc bloc = BlocProvider.of<LinkListBloc>(context);
          if (!bloc.init) {
            bloc.add(const FetchLinksEvent());
          }

          List<Widget> children = [];
          if (state is LinkListReceivedLinks) {
            debugPrint("received links");
            List<String> categories = [];
            List<LinkEntity> links = state.links;

            for (int i = 0; i < links.length; i++) {
              if (!categories.contains(links[i].categoryTitle)) {
                categories.add(links[i].categoryTitle);
                children.add(Container(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50.0, bottom: 20.0, top: 20.0),
                  child: Material(
                    child: ListTile(
                      title: Text(links[i].categoryTitle, style: const TextStyle
                        (color: Colors.white60)),
                      tileColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ));
              }

              // Add Link
              children.add(Container(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50.0, bottom: 20.0, top: 20.0),
                  child: ListTile(
                    leading: (links[i].image.isNotEmpty) ? Image.memory
                      (base64Decode(links[i].image), width: 120.0,) : null,
                    title: Text(links[i].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(links[i].description),
                        const SizedBox(height: 4.0),
                        Text(links[i].url),
                      ],
                    ),

                  )));
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Links'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Navigate to the settings page. If the user leaves and returns
                    // to the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
            ),

            // To work with lists that may contain a large number of items, it’s best
            // to use the ListView.builder constructor.
            //
            // In contrast to the default ListView constructor, which requires
            // building all Widgets up front, the ListView.builder constructor lazily
            // builds Widgets as they’re scrolled into view.
            body: RefreshIndicator(
              onRefresh: () async {
                bloc.add(const FetchLinksEvent());
              },
              child: ListView(
                children: children,
              ),
            ),
          );
        },
      ),
    );
  }
}
