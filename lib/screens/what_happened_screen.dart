import 'package:flutter/material.dart';
import 'package:retro_list/data_store/item_list_data_store.dart';
import 'package:retro_list/screens/fight_screen.dart';
import 'package:retro_list/screens/surrendered_screen.dart';

class WhatHappenedScreen extends StatefulWidget {
  @override
  _WhatHappenedScreenState createState() => _WhatHappenedScreenState();
}

class _WhatHappenedScreenState extends State<WhatHappenedScreen> {
  final ItemDataStore _dataStore = ItemDataStore();
  String _stolenItem = "";

  void _fight(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FightScreen()),
    );
  }

  void _surrender(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SurrenderedScreen()),
    );
  }

  void _stealItem() {
    setState(() {
      _dataStore.getStolenItem().then(
        (stolenItem) {
          setState(() {
            _stolenItem = stolenItem;
          });
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _stealItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _stolenItem,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Image.asset("images/hungry_monster.png"),
            SizedBox(height: 8),
//            Expanded(child: Image.asset("images/hungry_monster.png")),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "I WAS HUNGRY SO I STOLE YOUR ITEM.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            Text(
              "WHAT DO YOU WANT TO DO?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 11),
            FlatButton(
              onPressed: () {
                _fight(context);
              },
              color: Colors.white,
              child: Text(
                "FIGHT",
                style: Theme.of(context).textTheme.button,
              ),
            ),
            SizedBox(height: 12),
            FlatButton(
              onPressed: () {
                _surrender(context);
              },
              color: Colors.white,
              child: Text(
                "SURRENDER",
                style: Theme.of(context).textTheme.button,
              ),
            ),
//            SizedBox(height: 280),
          ],
        ),
      ),
    );
  }
}
