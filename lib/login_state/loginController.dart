import 'package:get/get.dart';

class LoginController extends GetxController {
  bool box = false;
  bool load = false;

  var name = "";
  var grade = "";
  var school = "";
  var id = "";
  inLogin() {
    box = true;
    update();
  }

  isProfile(var id, var name, var grade, var school) {
    this.id = id;
    this.name = name;
    this.grade = grade;
    this.school = school;
    update();
  }

  isLogout() {
    box = false;
    update();
  }
}
