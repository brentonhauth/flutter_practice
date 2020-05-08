import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  void increment() => setState(() { count++; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(
          '$count',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: increment,
        child: new Icon(Icons.add_circle_outline),
      ),
    );
  }
}