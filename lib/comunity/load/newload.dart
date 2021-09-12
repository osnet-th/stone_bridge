import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:stone_bridge_app/main.dart';
import 'load.dart';

class NewLoadScreen extends StatefulWidget {
  @override
  _NewLoadScreen createState() => _NewLoadScreen();
}

class _NewLoadScreen extends State<NewLoadScreen> {
  late TextEditingController _titleController;
  late TextEditingController _mainTextController;
  late FirebaseDatabase _database;
  late DatabaseReference reference;
  String _databaseURL = 'https://comunity-8b9e7-default-rtdb.firebaseio.com/';
  final _list = ['인기게시글', '자유게시판', '작품', '정보공유'];
  var _selected = '인기게시글';

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _mainTextController = TextEditingController();

    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('스톤브릿지'),
        leading: InkWell(
          child: Icon(Icons.arrow_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 280,
                child: Flexible(
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '제목을 입력하세요.',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              DropdownButton(
                value: _selected,
                items: _list.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selected = value.toString();
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Flexible(
                child: TextField(
                  maxLines: 10,
                  minLines: 1,
                  controller: _mainTextController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
                    border: OutlineInputBorder(),
                    hintText: '내용을 입력하세요.',
                  ),
                  textInputAction: TextInputAction.next,
                ),
              )),
          RaisedButton(
            onPressed: () {
              if (_titleController.value.text.length > 0) {
                if (_mainTextController.value.text.length > 0) {
                  reference
                      .child(_selected)
                      .push()
                      .set(Load(
                              _titleController.value.text,
                              _mainTextController.value.text,
                              DateTime.now().toIso8601String())
                          .toJson())
                      .then((_) {
                    Navigator.of(context).pop();
                  });
                } else
                  makeDialog('본문 내용을 입력해주세요');
              } else
                makeDialog('제목을 입력해주세요');
            },
            child: Text('글쓰기'),
            color: Color(0xFF0DCE9F),
          )
        ],
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
