import 'package:flutter/material.dart';

import 'item_list_screen.dart';

class FightWonScreen extends StatelessWidget {
  void _returnToList(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ItemListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "YOU WIN!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 49.0, height: 1.0),
                  Image.asset("images/concede_monster.png"),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "HERE IS YOUR ITEM BACK.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "FOR NOW...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 11),
              FlatButton(
                onPressed: () {
                  _returnToList(context);
                },
                color: Colors.white,
                child: Text(
                  "RETURN TO LIST",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
