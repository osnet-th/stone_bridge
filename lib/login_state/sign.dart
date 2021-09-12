import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:group_button/group_button.dart';
import 'package:stone_bridge_app/login_state/user.dart';

class SignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignPage();
}

class _SignPage extends State<SignPage> {
  late FirebaseDatabase _database;
  late DatabaseReference reference;
  String _databaseURL = 'https://login-70221-default-rtdb.firebaseio.com/';

  late TextEditingController _idTextController;
  late TextEditingController _pwTextController;
  late TextEditingController _pwCheckTextController;
  late TextEditingController _schoolTextController;
  late TextEditingController _nameTextController;
  var _isCheckGrade = [false, false, false, false];
  var _checkGrade = ['초등학생', '중학생', '고등학생', '대학생'];
  String _grade = '';
  var _isCheckService = [false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    _idTextController = TextEditingController();
    _pwTextController = TextEditingController();
    _pwCheckTextController = TextEditingController();
    _schoolTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_left),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('스톤브릿지'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      '스톤브릿지',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '자기주도학습에 날개를 달다',
                      style: TextStyle(fontSize: 15),
                    )),
                    SizedBox(
                      height: 30.0,
                    ),
                    _textForm(false, '이름', _nameTextController),
                    SizedBox(
                      height: 15.0,
                    ),
                    _textForm(false, '아이디', _idTextController),
                    SizedBox(
                      height: 15.0,
                    ),
                    _textForm(true, '비밀번호', _pwTextController),
                    SizedBox(
                      height: 15.0,
                    ),
                    _textForm(true, '비밀번호 확인', _pwCheckTextController),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xFF0DCE9F), // set border color
                                width: 3.0), // set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0)), // set rounded corner radius
                          ),
                          child: TextField(
                            controller: _schoolTextController,
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: '학교', border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(width: 25),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            color: Color(0xFF0DCE9F),
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _checkBox(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFF0DCE9F),
                        border: Border.all(
                            color: Color(0xFF0DCE9F), // set border color
                            width: 3.0), // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)), // set rounded corner radius
                      ),
                      child: FlatButton(
                        onPressed: () {
                          reference.child(_idTextController.value.text).set({
                            'name': 'Yashwant Kumar',
                            'description': 'Senior Software Engineer'
                          });
                        },
                        child: Text(
                          '회원가입',
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                        color: Color(0xFF0DCE9F),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ))));
  }

  Widget _checkBox() {
    return GroupButton(
      isRadio: true,
      spacing: 20,
      onSelected: (index, isSelected) {
        setState(() {
          _grade = _checkGrade[index];
        });
      },
      buttons: [
        "초등학생",
        "중학생",
        "고등학생",
        "대학생",
      ],
      selectedColor: Color(0xFF0DCE9F),
      unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
    );
  }

  Widget _textForm(bool text, String label, TextEditingController _controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Color(0xFF0DCE9F), // set border color
            width: 3.0), // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius
      ),
      child: TextField(
        controller: _controller,
        obscureText: text,
        maxLines: 1,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

  void _check() {
    if (_idTextController.value.text.length >= 4) {
      if (_pwTextController.value.text.length >= 6) {
        if (_schoolTextController.text.length != 0) {
          if (_pwTextController.value.text ==
              _pwCheckTextController.value.text) {
            var bytes = utf8.encode(_pwTextController.value.text);
            var digest = sha1.convert(bytes);
            reference
                .child(_idTextController.value.text)
                .push()
                .set(Load(
                  _idTextController.value.text, //id
                  digest.toString(), //pw
                  _nameTextController.value.text, //name
                  DateTime.now().toIso8601String(), //만들어진 시간
                  _grade, // 학년
                  _schoolTextController.value.text, // 학교
                ).toJson())
                .then((_) {
              Navigator.of(context).pop();
            });
          } else {
            makeDialog('비밀번호가 틀립니다');
          }
        } else {
          makeDialog('학교를 입력해주세요');
        }
      } else {
        makeDialog('비밀번호는 6자리 이상');
      }
    } else {
      makeDialog('아이디 길이는 4자리 이상');
    }
  }

  void makeDialog(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
          );
        });
  }
}
