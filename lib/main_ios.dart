import 'package:flutter/cupertino.dart';
import 'package:flutter_talk_app/src/ios/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CupertinoAppExample());
}

class CupertinoAppExample extends StatelessWidget {
  const CupertinoAppExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter iOS Movies',
      home: HomePage(),
    );
  }
}
