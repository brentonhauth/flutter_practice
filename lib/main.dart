import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'counter.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: new MaterialApp(
        title: "3a. Counter App (with Providers)",
        home: new HomePage(),
        theme: new ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
      )
    );
  }

}
