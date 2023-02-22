import 'package:flutter/cupertino.dart';
import 'package:flutter_talk_app/src/ios/base_cupertino_page.dart';
import 'package:flutter_talk_app/src/ios/first_page.dart';
import 'package:flutter_talk_app/src/ios/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _pages = const <BaseCupertinoPage>[
    FirstPage(),
    SecondPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time), label: 'Other'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _pages[index];
          },
        );
      },
    );
  }
}
