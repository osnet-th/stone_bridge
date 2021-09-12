import 'package:flutter/material.dart';
import 'package:stone_bridge_app/Lecture/WebLectureScreen.dart';

class DataAnalysisScreen extends StatefulWidget {
  @override
  _DataAnalysisScreen createState() => _DataAnalysisScreen();
}

class _DataAnalysisScreen extends State<DataAnalysisScreen> {
  double cardHeight = 300;

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
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              '데이터 분석',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          menu(),
          SizedBox(
            height: 10,
          ),
          popularLectures(),
          SizedBox(
            height: 10,
          ),
          newLectures(),
          SizedBox(
            height: 10,
          ),
          recommendedLecture(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget menu() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text('Java'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'Python',
                softWrap: false,
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'HTML/CSS',
                softWrap: false,
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'Nods.js',
                softWrap: false,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'Spring',
                softWrap: false,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'React',
                softWrap: false,
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'Django',
                softWrap: false,
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF0DCE9F),
              onPressed: () {},
              child: Text(
                'jQuery',
                softWrap: false,
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ),
        ],
      ),
    ]);
  }

  Widget popularLectures() {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.circle,
            size: 10,
            color: Color(0xFF0DCE9F),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "인기강의",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          Text("  최근 가장 많이 본 영상입니다.")
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 5,
                    height: cardHeight,
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                          height: 170,
                          child: Image.asset(
                            "image2/interview1.JPG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '멘토',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text("4th"),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '만족도',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "★★★★",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '수강후기',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "41",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen()));
                },
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 5,
                  height: cardHeight,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          child: Image.asset(
                            "image2/interview2.JPG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '멘토',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text("4th"),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '만족도',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "★★★★",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '수강후기',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "41",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              )
            ],
          )),
    ]);
  }

  Widget newLectures() {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.circle,
            size: 10,
            color: Color(0xFF0DCE9F),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "새로운 강의",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          Text("  새로 들어온 강의입니다.")
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 5,
                    height: cardHeight,
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                          height: 170,
                          child: Image.asset(
                            "image2/interview1.JPG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '멘토',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text("4th"),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '만족도',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "★★★★",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '수강후기',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "41",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ))),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 5,
                  height: cardHeight,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          child: Image.asset(
                            "image2/interview2.JPG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '멘토',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text("4th"),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '만족도',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "★★★★",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '수강후기',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "41",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              )
            ],
          )),
    ]);
  }

  Widget recommendedLecture() {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.circle,
            size: 10,
            color: Color(0xFF0DCE9F),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "추천 강의",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          Text("  후기가 확실한 강의! 한번 들어보세요.")
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 5,
                    height: cardHeight,
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                          height: 170,
                          child: Image.asset(
                            "image2/interview1.JPG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '멘토',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text("4th"),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '만족도',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "★★★★",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '수강후기',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "41",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ))),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 5,
                  height: cardHeight,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          child: Image.asset(
                            "image2/interview2.JPG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '멘토',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text("4th"),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '만족도',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "★★★★",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          child: ListTile(
                            title: Text(
                              '수강후기',
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "41",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              )
            ],
          )),
    ]);
  }
}
