import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Eggs counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String mainText = "Click on timer to start";
    final ButtonStyle style3 = ElevatedButton.styleFrom(
        textStyle:
            const TextStyle(fontSize: 20, backgroundColor: Color(0xFFEEAA)));
    final ButtonStyle style6 = ElevatedButton.styleFrom(
        textStyle:
            const TextStyle(fontSize: 20, backgroundColor: Color(0xAAEEAA)));
    final ButtonStyle style9 = ElevatedButton.styleFrom(
        textStyle:
            const TextStyle(fontSize: 20, backgroundColor: Color(0xFF88AA)));

    void timer(int time) {
      Timer.periodic(Duration(seconds: time), (timer) {
        log(timer.toString());
        mainText = "Time is doooone";
      });
      log(time.toString());
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(mainText, style: TextStyle(fontSize: 25)),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow)),
              onPressed: () {
                timer(3);
              },
              child: const Text('3 minutes'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(Colors.orange)),
              onPressed: () {
                timer(6);
              },
              child: const Text('6 minutes'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                timer(9);
              },
              child: const Text('9 minutes'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
