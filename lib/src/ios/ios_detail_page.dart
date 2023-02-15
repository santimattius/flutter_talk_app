import 'package:flutter/cupertino.dart';
import 'package:flutter_talk_app/src/ios/base_cupertino_page.dart';

class IOSDetailPage extends BaseCupertinoPage {
  const IOSDetailPage({super.key});

  @override
  Widget content(BuildContext context) {
    return Container(color: CupertinoColors.activeGreen);
  }

  @override
  String title() => 'Detail Cupertino Page';
}
