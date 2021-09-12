import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreen createState() => _PopularScreen();
}

class _PopularScreen extends State<PopularScreen> {
  late FirebaseDatabase _database;
  var reference;
  String _databaseURL = 'https://comunity-8b9e7-default-rtdb.firebaseio.com/';
  late var title = []..length = 500;

  late var mainText = []..length = 500;
  late var createTime = []..length = 500;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  //List<String> _mainlist = [];
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database.reference();
    _dataList();
  }

//title.iterator.moveNext()
  @override
  Widget build(BuildContext context) {
    return title.first == null
        ? Center(
            child: Center(child: Center(child: CircularProgressIndicator())))
        : _listTile();
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
    await reference.child('인기게시글').once().then((DataSnapshot snapshot) {
      print(snapshot.value);

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

  @override
  void dispose() {
    super.dispose();
  }
}
