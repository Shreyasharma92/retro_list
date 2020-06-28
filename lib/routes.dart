import 'package:flutter/widgets.dart';
import 'package:retro_list/screens/fight_screen.dart';
import 'package:retro_list/screens/fight_won_screen.dart';
import 'package:retro_list/screens/item_list_screen.dart';
import 'package:retro_list/screens/something_happened_screen.dart';
import 'package:retro_list/screens/surrendered_screen.dart';
import 'package:retro_list/screens/what_happened_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/ListScreen": (BuildContext context) => ItemListScreen(),
  "/SomethingHappenedScreen": (BuildContext context) =>
      SomethingHappenedScreen(),
  "/WhatHappenedScreen": (BuildContext context) => WhatHappenedScreen(),
  "/SurrenderedScreen": (BuildContext context) => SurrenderedScreen(),
  "/FightScreen": (BuildContext context) => FightScreen(),
  "/FightWonScreen": (BuildContext context) => FightWonScreen(),
};
