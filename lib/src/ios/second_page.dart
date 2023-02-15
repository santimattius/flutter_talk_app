import 'package:flutter/cupertino.dart';
import 'package:flutter_talk_app/src/ios/base_cupertino_page.dart';

class SecondPage extends BaseCupertinoPage {
  const SecondPage({super.key});

  @override
  Widget content(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  @override
  String title() => 'Second Cupertino Page';
}
