import 'package:firebase_database/firebase_database.dart';

class Load {
  String title;
  String mainText;
  String createTime;

  Load(this.title, this.mainText, this.createTime);

  Load.fromSnapshot(DataSnapshot snapshot)
      : title = snapshot.value['title'],
        mainText = snapshot.value['mainText'],
        createTime = snapshot.value['createTime'];

  toJson() {
    return {
      'title': title,
      'mainText': mainText,
      'createTime': createTime,
    };
  }
}
