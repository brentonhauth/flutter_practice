import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Counter.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var count = Provider.of<Counter>(context);

    return Scaffold(
      body: new Center(
        child: Consumer<Counter>(
          builder: (context, counter, child) {
            return new Text(
              '${counter.getCount()}',
              style: Theme.of(context).textTheme.headline1,
            );
          },
        )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: count.increment,
        child: new Icon(Icons.add_circle_outline),
      ),
    );
  }
}
