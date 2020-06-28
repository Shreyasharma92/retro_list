import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:retro_list/data_store/item_list_data_store.dart';

class ItemListScreenState extends State<ItemListScreen> {
  final ItemDataStore _dataStore = ItemDataStore();
  final myController = TextEditingController();

  Future<Void> _initializeText() async {
    myController.text = await _dataStore.getStoredDataList();
  }

  _persistText(String text) {
    _dataStore.updateList(text);
  }

  @override
  void initState() {
    super.initState();
    _initializeText();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(56.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'MY LIST',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          height: 30,
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.characters,
                          maxLines: null,
                          controller: myController,
                          textInputAction: TextInputAction.done,
                          onChanged: (updatedText) {
                            _persistText(updatedText);
                          },
                          onEditingComplete: () {
                            print(myController.text);
                            // TODO: Potential improvement the * should be appended on the following line of the current selection
                            var newText = myController.text + "\n" + "* ";
                            myController.text = newText;
                            // var currentSelection = myController.selection;
                            myController.selection =
                                TextSelection.collapsed(offset: newText.length);
                            _persistText(newText);
                          },
                          decoration: InputDecoration(
                              filled: false,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0)),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          cursorColor: Colors.white,
                          cursorWidth: 4,
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class ItemListScreen extends StatefulWidget {
  @override
  ItemListScreenState createState() => ItemListScreenState();
}
