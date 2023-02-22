import 'package:flutter_talk_app/src/sample_feature/sample_item.dart';

abstract class FeatureProvider {
  static const feature = [
    SampleItem(id: 1, title: 'Sample Navigation', route: '/sample_item'),
    SampleItem(id: 2, title: 'Movies using Future', route: '/movies-future'),
    SampleItem(id: 3, title: 'Movies', route: '/movies'),
  ];
}
