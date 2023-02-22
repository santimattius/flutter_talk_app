import 'package:flutter/cupertino.dart';
import 'package:flutter_talk_app/src/ios/base_cupertino_page.dart';
import 'package:flutter_talk_app/src/ios/ios_detail_page.dart';

class FirstPage extends BaseCupertinoPage {
  const FirstPage({super.key});

  @override
  Widget content(BuildContext context) {
    return Center(
      child: CupertinoButton(
        onPressed: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => const IOSDetailPage()));
        },
        child: const Text('Press here'),
      ),
    );
  }

  @override
  String title() => 'First Cupertino Page';
}
