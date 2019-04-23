
import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  OtherPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Widget: ${widget.title}'),
      ),
    );
  }
}
