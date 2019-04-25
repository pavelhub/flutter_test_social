import 'package:flutter/material.dart';
import 'package:flutter_app/page/chat_page.dart';
import 'package:flutter_app/page/discover_page.dart';
import 'package:flutter_app/page/other_page.dart';
import 'package:flutter_app/presentation/soc_app_icons.dart' as CustomIcon;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentIconTheme:
            Theme.of(context).accentIconTheme.copyWith(color: Colors.black),
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.black),
        primaryTextTheme:
            Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.black),
        primarySwatch: Colors.blue,
      ),
      home: MasterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MasterPage extends StatefulWidget {
  MasterPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: [
              DiscoverPage(title: "Discover"),
              ChatPage(title: "Chats"),
              OtherPage(title: "Feed"),
              OtherPage(title: "Some"),
              OtherPage(title: "People"),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                  icon: Icon(CustomIcon.SocApp.tab_icon_discover),
                  text: _currentIndex == 0 ? "Discover" : ""),
              Tab(
                  icon: Icon(CustomIcon.SocApp.tab_icon_cahat),
                  text: _currentIndex == 1 ? "Chats" : ""),
              Tab(
                  icon: Icon(CustomIcon.SocApp.tab_icon_fill),
                  text: _currentIndex == 2 ? "Fill" : ""),
              Tab(
                  icon: Icon(CustomIcon.SocApp.tab_icon_shape),
                  text: _currentIndex == 3 ? "Shape" : ""),
              Tab(
                  icon: Icon(CustomIcon.SocApp.tab_icon_face),
                  text: _currentIndex == 4 ? "People" : ""),
            ],
            onTap: (selected) {
              setState(() {
                _currentIndex = selected;
              });
            },
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(0),
            labelPadding: EdgeInsets.all(0),
            labelStyle: TextStyle(fontSize: 10),
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
