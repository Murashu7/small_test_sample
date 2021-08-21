import 'package:flutter/material.dart';
import 'package:small_test_sample/address_checker.dart';
import 'package:small_test_sample/age_checker.dart';
import 'package:small_test_sample/api.dart';
import 'package:small_test_sample/item_checker.dart';
import 'package:small_test_sample/user_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _api = Api(
    ItemCheckerImpl(),
    UserCheckerImpl(
      AgeCheckerImpl(),
      AddressCheckerImpl(),
    ),
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    DB.stock["iPhoneSE"] = 3;
    print(_api.check("iPhone7", 20, "tokyo"));

    DB.stock["iPhone8"] = 3;
    print(_api.check("iPhone8", 19, "osaka"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
