class AppState {
  static final AppState _appState = AppState._internal();

  bool hasWhatHappenedScreenBeenShown = false;

  factory AppState() {
    return _appState;
  }

  AppState._internal();
}
