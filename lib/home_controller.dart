import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {
  int SelectedBottomTab = 0;
  bool isRighthDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBonnetLock = true;
  bool isTrunkLock = true;
  bool isCoolSelected = true;
  bool isShowTyre = false;
  bool isShowTyreStatus = false;

  void UpdateSelectedBottomTab(int index) {
    SelectedBottomTab = index;
    notifyListeners();
  }

  void UpdateRightDoorLock() {
    isRighthDoorLock = !isRighthDoorLock;
    notifyListeners();
  }

  void UpdateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void UpdateBonnetLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void UpdateTrunkLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  void UpdateCoolSelected() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  void ShowTyreController(int index) {
    if (SelectedBottomTab != 3 && index == 3) {
      Future.delayed(
        Duration(milliseconds: 400),
        () {
          isShowTyre = true;
          notifyListeners();
        },
      );
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  void TyreStatusController(int index) {
    if (SelectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(
        Duration(milliseconds: 600),
        () {
          isShowTyreStatus = false;
          notifyListeners();
        },
      );
    }
  }
}
