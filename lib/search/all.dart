import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  @override
  _All createState() => _All();
}

class _All extends State<All> {
  late FirebaseDatabase _database;
  var reference;
  String _databaseURL = 'https://comunity-8b9e7-default-rtdb.firebaseio.com/';
  late var title;
  late var mainText;
  late var createTime;
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "인기검색어",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 110,
                            child: Text(
                              '#아두이노',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0DCE9F)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 110,
                            child: Text(
                              '#플러터',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0DCE9F)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 110,
                            child: Text(
                              '#데이터베이스',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0DCE9F)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 110,
                            child: Text(
                              '#앱디자인',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0DCE9F)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 110,
                            child: Text(
                              '#졸업작품 전시회',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0DCE9F)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 110,
                            child: Text(
                              '더보기',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0DCE9F)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "인기 커뮤니티 글",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      leading: Image.asset('image/human_green.png',
                          fit: BoxFit.cover),
                      title: Text("익명"),
                      subtitle: Text("졸업작품 정보 같이 공유하실분!"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      leading: Image.asset('image/human_green.png',
                          fit: BoxFit.cover),
                      title: Text("익명"),
                      subtitle: Text("아두이노멘토 추천좀 부탁드려요"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      leading: Image.asset('image/human_green.png',
                          fit: BoxFit.cover),
                      title: Text("익명"),
                      subtitle: Text("다들 취준하면서 고민 없으신가요? ㅠㅠ"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      leading: Image.asset('image/human_green.png',
                          fit: BoxFit.cover),
                      title: Text("익명"),
                      subtitle: Text("같이 스터디 하실분 계신가요?"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      leading: Image.asset('image/human_green.png',
                          fit: BoxFit.cover),
                      title: Text("익명"),
                      subtitle: Text("아두이노멘토 추천좀 부탁드려요"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      leading: Image.asset('image/human_green.png',
                          fit: BoxFit.cover),
                      title: Text("익명"),
                      subtitle: Text("같이 스터디 하실분 계신가요?"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _listTile() {
    return ListView.builder(
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.0,
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: title[index] == null
              ? null
              : Column(children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                    leading:
                        Image.asset('image/human_green.png', fit: BoxFit.cover),
                    title: Text("익명            ${title[index]}"),
                    subtitle: Text('${mainText[index]}'),
                    trailing: Text('${createTime[index]} '),
                  ),
                ]),
        );
      },
    );
  }

  Future<void> _dataList(BuildContext context) async {
    await reference.child('인기게시글').once().then((DataSnapshot snapshot) {
      print('--value값--${snapshot.value}');
      print('--key값-- ${snapshot.key}');

      snapshot.value.forEach((key, values) {
        print('key값:$values');
        setState(() {
          if (title.length >= i) {
            print(values['title']);
            title[i] = values['title'];
            print('${title[i]}');
            print(values['mainText']);
            mainText[i] = values['mainText'];
            print(values['createTime']);
            createTime[i] = values['createTime'].toString().substring(11, 19);
            i = i + 1;
          } else {
            return;
          }
        });
      });
    });
  }
}
