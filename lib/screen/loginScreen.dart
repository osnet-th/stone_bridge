// Flutter

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

import 'package:stone_bridge_app/login_state/loginController.dart';

// 스톤브릿지
import 'package:stone_bridge_app/login_state/sign.dart';
import 'package:stone_bridge_app/login_state/user.dart';
import 'package:stone_bridge_app/main.dart';
import 'package:stone_bridge_app/screen/profileScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late FirebaseDatabase _database;
  late DatabaseReference reference;
  String _databaseURL = 'https://login-70221-default-rtdb.firebaseio.com/';

  late TextEditingController _idTextController;
  late TextEditingController _pwTextController;
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();

    _idTextController = TextEditingController(text: '');
    _pwTextController = TextEditingController(text: '');

    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database.reference();
  }

  void _check() {
    reference
        .child(_idTextController.value.text)
        .once()
        .then((DataSnapshot snapshot) {
      print(snapshot.value['pw']);
      if (snapshot.value['pw'] == _pwTextController.value.text) {
        Get.find<LoginController>().inLogin();
        Get.find<LoginController>().isProfile(
            snapshot.value['id'],
            snapshot.value['name'],
            snapshot.value['grade'],
            snapshot.value['school']);
        Get.offAll(StoneBridge());
      }
    });
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
      resizeToAvoidBottomInset: false,
      body: Get.find<LoginController>().box == true
          ? ProfileScreen()
          : SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        '스톤브릿지',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        '자기주도학습에 날개를 달다',
                        style: TextStyle(fontSize: 15),
                      )),
                      SizedBox(
                        height: 45.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color(0xFF0DCE9F), // set border color
                              width: 3.0), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          controller: _idTextController,
                          maxLines: 1,
                          decoration: InputDecoration(
                              labelText: '아이디', border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color(0xFF0DCE9F), // set border color
                              width: 3.0), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          controller: _pwTextController,
                          obscureText: true,
                          maxLines: 1,
                          decoration: InputDecoration(
                              labelText: '비밀번호', border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFF0DCE9F),
                          border: Border.all(
                              color: Color(0xFF0DCE9F), // set border color
                              width: 3.0), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              20.0)), // set rounded corner radius
                        ),
                        child: FlatButton(
                          onPressed: () {
                            _check();
                          },
                          child: Text(
                            '로그인',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                          color: Color(0xFF0DCE9F),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '아직 회원이 아니세요?',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignPage()));
                              },
                              child: Text('회원가입',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      _kakao(),
                      SizedBox(height: 10),
                      _facebook(),
                      SizedBox(height: 10),
                      _naver(),
                      SizedBox(height: 20),
                    ],
                  ))),
    );
  }

  Widget _kakao() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.yellow, // set border color
            width: 3.0), // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(20.0)), // set rounded corner radius
      ),
      child: FlatButton(
        onPressed: () {
          //    _loginWithKakao();
        },
        child: Text(
          '카카오톡 로그인',
          style: TextStyle(
              fontSize: 15, color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _facebook() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.blue, // set border color
            width: 3.0), // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(20.0)), // set rounded corner radius
      ),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          '페이스북 로그인',
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
      ),
    );
  }

  Widget _naver() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.greenAccent, // set border color
            width: 3.0), // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(20.0)), // set rounded corner radius
      ),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          '네이버 로그인',
          style: TextStyle(fontSize: 15, color: Colors.greenAccent),
        ),
      ),
    );
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
