import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class FreeScreen extends StatefulWidget {
  @override
  _FreeScreen createState() => _FreeScreen();
}

class _FreeScreen extends State<FreeScreen> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  late FirebaseDatabase _database;
  var reference;
  String _databaseURL = 'https://comunity-8b9e7-default-rtdb.firebaseio.com/';
  late var title = []..length = 500;

  late var mainText = []..length = 500;
  late var createTime = []..length = 500;

  //List<String> _mainlist = [];
  int i = 0;
  @override
  void initState() {
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

  Future<void> _dataList() async {
    await reference.child('자유게시판').once().then((DataSnapshot snapshot) {
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

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
