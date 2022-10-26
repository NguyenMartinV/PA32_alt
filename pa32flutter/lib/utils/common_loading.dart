import 'package:flutter_easyloading/flutter_easyloading.dart';

class CommonLoading {
  static show() {
    EasyLoading.instance..maskType = EasyLoadingMaskType.clear;
    EasyLoading.show();
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
