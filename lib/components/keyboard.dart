import 'package:flutter/material.dart';

// Gid based keyboard
class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 6,
        ),
      ),
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 10,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(50, (index) {
          return Container(
//            margin: EdgeInsets.fromLTRB(4, 9, 4, 9),
//            padding: EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(0.2),
              child: FlatButton(
                onPressed: () {
                  print("A");
                },
                color: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
