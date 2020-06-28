import 'package:flutter/material.dart';

class SquashableMonster extends StatefulWidget {
  final Function() onMonsterDestroyed;

  SquashableMonster({@required this.onMonsterDestroyed});

  @override
  _State createState() => _State();
}

class _State extends State<SquashableMonster> {
  int _step = 1;
  final int _maxSteps = 26;

  void _damageBug() {
    setState(() {
      if (_step < _maxSteps) {
        _step += 1;
      } else {
        widget.onMonsterDestroyed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        _damageBug();
      },
      child: Image.asset(
        'sprites/monster_$_step.png',
      ),
    );
  }
}
