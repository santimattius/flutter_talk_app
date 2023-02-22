import 'package:flutter/material.dart';
import 'package:flutter_talk_app/src/sample_feature/feature_provider.dart';
import 'package:flutter_talk_app/src/settings/settings_view.dart';

import 'sample_item.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = FeatureProvider.feature,
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(
              title: Text(item.title),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  item.route,
                );
              });
        },
      ),
    );
  }
}
