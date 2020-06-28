import 'package:flutter/material.dart';
import 'package:retro_list/components/squashable_monster.dart';
import 'package:retro_list/screens/fight_won_screen.dart';

class FightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    fightWon() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FightWonScreen()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FIGHT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              SizedBox(
                width: 152,
                height: 152,
                child: SquashableMonster(
                  onMonsterDestroyed: fightWon,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
