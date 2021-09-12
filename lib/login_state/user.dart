import 'package:firebase_database/firebase_database.dart';

class Load {
  String id;
  String pw;
  String name;
  String grade;
  String school;
  String createTime;

  Load(this.id, this.pw, this.name, this.createTime, this.grade, this.school);

  Load.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.value['id'],
        pw = snapshot.value['pw'],
        name = snapshot.value['name'],
        createTime = snapshot.value['createTime'],
        grade = snapshot.value['grade'],
        school = snapshot.value['school'];

  toJson() {
    return {
      'id': id,
      'pw': pw,
      'name': name,
      'grade': grade,
      'school': school,
      'createTime': createTime,
    };
  }
}
