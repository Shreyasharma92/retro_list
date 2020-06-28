import 'package:retro_list/utils/list_items_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDataStore {
  static final ItemDataStore _itemDataStore = ItemDataStore._internal();

  factory ItemDataStore() {
    return _itemDataStore;
  }

  ItemDataStore._internal();

  static const fullListKey = "fullListKey";

  Future<String> getStoredDataList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _itemList = "* ";
    var containsKey = prefs.containsKey(fullListKey);
    if (containsKey) {
      _itemList = prefs.getString(fullListKey);
    }

    return _itemList;
  }

  void updateList(String updatedListStr) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(fullListKey, updatedListStr);
    });
  }

  Future<String> getStolenItem() async {
    String fullList = await getStoredDataList();
    String _stolenItem = ListItemUtils.stealListItem(fullList);
    return _stolenItem ?? "";
  }

  Future<void> surrenderStolenItem() async {
    String fullList = await getStoredDataList();
    String stolenItem = await getStolenItem();
    String newList = ListItemUtils.removeItemFromList(stolenItem, fullList);

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(fullListKey, newList);
    });
  }
}
