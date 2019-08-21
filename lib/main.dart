import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
      primarySwatch: Colors.red,
    );
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );

    String title = "Welcome to Flutter";
        MaterialApp materialApp = MaterialApp(
            title: title, 
            theme: themeData, 
            home: scaffold
        );
    return materialApp;
  }
}
