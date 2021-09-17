import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchBook extends StatefulWidget {
  @override
  _SearchBookState createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  List book = [];
  TextEditingController query = new TextEditingController();

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&size=50&query=${query.value.text}');
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK 186f7ca874a0245f78c8908bb749df89"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);

      List result = dataConvertedToJSON["documents"];
      book.addAll(result);
    });
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: query,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration:
              InputDecoration(icon: Icon(Icons.search), hintText: '검색어를 입력하세요'),
        ),
      ),
      body: Container(
          child: Center(
        child: book.length == 0
            ? Text(
                "데이터가 없습니다",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      child: Row(
                        children: [
                          Image.network(
                            book[index]['thumbnail'],
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child: Text(book[index]['title'].toString()),
                              ),
                              Text(book[index]['authors'].toString()),
                              Text(book[index]['sale_price'].toString()),
                              Text(book[index]['status'].toString()),
                              Text(book[index]['datetime'].toString())
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: book.length,
              ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (query.value.text.length == 0) {
            _showDialog();
          } else {
            book.clear();
            getJSONData();
          }
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("경고🥲!"),
          content: new Text("검색어를 입력해주세요."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
