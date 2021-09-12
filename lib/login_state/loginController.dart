import 'package:get/get.dart';

class LoginController extends GetxController {
  bool box = false;
  bool load = false;
  inLogin() {
    box = true;
    update();
  }

  isLogout() {
    box = false;
    update();
  }
}
