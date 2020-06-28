import 'package:flutter/material.dart';
import 'package:retro_list/screens/what_happened_screen.dart';

class SomethingHappenedScreen extends StatelessWidget {
  void _seeWhatHappened(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WhatHappenedScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/left_looking_mini_bug.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
                      child: Text(
                        "OH NO!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Image.asset(
                      'images/right_looking_mini_bug.png',
                    ),
                  ],
                ),
                SizedBox(height: 11),
                Text(
                  "SOMETHING HAS HAPPENED!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 11),
                FlatButton(
                  onPressed: () {
                    _seeWhatHappened(context);
                  },
                  color: Colors.white,
                  child: Text(
                    "WHAT HAPPENED?",
                    style: Theme.of(context).textTheme.button,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
