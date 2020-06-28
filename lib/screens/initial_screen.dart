import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:retro_list/data_store/item_list_data_store.dart';
import 'package:retro_list/screens/item_list_screen.dart';
import 'package:retro_list/screens/what_happened_screen.dart';
import 'package:retro_list/state_management/app_state.dart';
import 'package:retro_list/utils/list_items_utils.dart';
import 'something_happened_screen.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  ItemDataStore _dataStore = ItemDataStore();
  bool _shouldShowSomethingHappenedScreen = false;

  // ignore: missing_return
  Future<Void> _setInitialScreenFlag() async {
    String currentList = await _dataStore.getStoredDataList();
    setState(() {
      _shouldShowSomethingHappenedScreen =
          ListItemUtils.hasListItemToSteal(currentList) &&
              !AppState().hasWhatHappenedScreenBeenShown;
    });
  }

  @override
  void initState() {
    super.initState();
    _setInitialScreenFlag();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "Building screen _shouldShowSomethingHappenedScreen: $_shouldShowSomethingHappenedScreen");
    if (_shouldShowSomethingHappenedScreen) {
      AppState().hasWhatHappenedScreenBeenShown = true;
      return SomethingHappenedScreen();
    } else {
      return ItemListScreen();
    }
  }
}
