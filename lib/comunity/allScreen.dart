import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class AllScreen extends StatefulWidget {
  @override
  _AllScreen createState() => _AllScreen();
}

class _AllScreen extends State<AllScreen> {
  late FirebaseDatabase _database;
  var reference;
  String _databaseURL = 'https://comunity-8b9e7-default-rtdb.firebaseio.com/';
  var title = []..length = 100;

  var mainText = []..length = 100;
  var createTime = []..length = 100;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int i = 0;

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database.reference();
    refreshList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0)); //thread sleep 같은 역할을 함.
    //새로운 정보를 그려내는 곳
    _dataList();
    return null;
  }

//title.iterator.moveNext()
  @override
  Widget build(BuildContext context) {
    return title.first == null
        ? Center(
            child: Center(child: Center(child: CircularProgressIndicator())))
        : RefreshIndicator(
            key: refreshKey,
            child: _listTile(),
            onRefresh: refreshList,
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

  void _dataList() {
    reference.child('인기게시글').once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) {
        if (this.mounted) {
          setState(() {
            if (title.length >= i) {
              title[i] = values['title'];
              mainText[i] = values['mainText'];
              createTime[i] = values['createTime'].toString().substring(11, 19);
              i = i + 1;
            } else {
              return;
            }
          });
        }
      });
    });

    reference.child('자유게시판').once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) {
        if (this.mounted) {
          setState(() {
            if (title.length >= i) {
              title[i] = values['title'];
              mainText[i] = values['mainText'];
              createTime[i] = values['createTime'].toString().substring(11, 19);
              i = i + 1;
            } else {
              return;
            }
          });
        }
      });
    });
    reference.child('정보공유').once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) {
        if (this.mounted) {
          setState(() {
            if (title.length >= i) {
              title[i] = values['title'];
              mainText[i] = values['mainText'];
              createTime[i] = values['createTime'].toString().substring(11, 19);
              i = i + 1;
            } else {
              return;
            }
          });
        }
      });
    });
    reference.child('작품').once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) {
        if (this.mounted) {
          setState(() {
            if (title.length >= i) {
              title[i] = values['title'];
              mainText[i] = values['mainText'];
              createTime[i] = values['createTime'].toString().substring(11, 19);
              i = i + 1;
            } else {
              return;
            }
          });
        }
      });
    });
  }
}
