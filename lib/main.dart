import 'package:flutter/material.dart';
import 'package:retro_list/routes.dart';
import 'package:retro_list/screens/initial_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'Retro list',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'dos',
        primaryColor: Colors.white,
        textTheme: TextTheme(
          button: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
        buttonTheme: ButtonThemeData(
          minWidth: 230.0,
          padding: EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 16.0),
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        body: SafeArea(
          child: InitialScreen(),
        ),
      ),
    );
  }
}
