class ListItemUtils {
  static final RegExp _listItemRegex = RegExp(r"\*.*\n");

  static String stealListItem(String listItemsStr) {
    var hasMatch = hasListItemToSteal(listItemsStr);
    if (!hasMatch) {
      return "";
    }

    // TODO choose a random item from the list not the first one
    String stolenItemStr = _listItemRegex.firstMatch(listItemsStr).group(0);
    return stolenItemStr;
  }

  static String removeItemFromList(String stolenItem, String fullList) {
    String newList = fullList.replaceFirst(stolenItem, "");
    return newList;
  }

  static bool hasListItemToSteal(String listItemsStr) {
    return _listItemRegex.hasMatch(listItemsStr);
  }
}
