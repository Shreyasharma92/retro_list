import 'package:flutter/material.dart';
import 'package:retro_list/data_store/item_list_data_store.dart';
import 'package:retro_list/screens/item_list_screen.dart';

class SurrenderedScreen extends StatelessWidget {
  final ItemDataStore _dataStore = ItemDataStore();

  void _returnToList(BuildContext context) {
    _dataStore.surrenderStolenItem();

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
                "SURRENDER",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Image.asset("images/victorious_monster.png"),
              SizedBox(height: 8),
              Text(
                "THANKS. THAT WAS DELICIOUS.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "CANNOT WAIT TO EAT AGAIN.",
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
              SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
