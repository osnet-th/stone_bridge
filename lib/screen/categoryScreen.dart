import 'package:flutter/material.dart';
import 'package:stone_bridge_app/categoryScreen/app_web_design/designScreen.dart';
import 'package:stone_bridge_app/categoryScreen/app_web_design/publishingScreen.dart';
import 'package:stone_bridge_app/categoryScreen/app_web_design/responsiveScreen.dart';
import 'package:stone_bridge_app/categoryScreen/data_science/aiScreen.dart';
import 'package:stone_bridge_app/categoryScreen/data_science/dataanalysisScreen.dart';
import 'package:stone_bridge_app/categoryScreen/data_science/databaseScreen.dart';
import 'package:stone_bridge_app/categoryScreen/develop/appScreen.dart';
import 'package:stone_bridge_app/categoryScreen/develop/programmingScreen.dart';
import 'package:stone_bridge_app/categoryScreen/develop/webScreen.dart';
import 'package:stone_bridge_app/categoryScreen/network/automationScreen.dart';
import 'package:stone_bridge_app/categoryScreen/network/infraScreen.dart';
import 'package:stone_bridge_app/categoryScreen/network/securityScreen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreen createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 70,
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Color(0xFF0DCE9F),
                    onPressed: () {},
                    child: Text('기자재 대여'),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
                Container(
                  width: 170,
                  height: 70,
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Color(0xFF0DCE9F),
                    onPressed: () {},
                    child: Text('멤버십 신청'),
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
                  width: 170,
                  height: 70,
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Color(0xFF0DCE9F),
                    onPressed: () {},
                    child: Text('멘토소개'),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
                Container(
                  width: 170,
                  height: 70,
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Color(0xFF0DCE9F),
                    onPressed: () {},
                    child: Text('멘토링신청'),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Color(0xFF0DCE9F),
                            title:
                                Text('개발/프로그래밍', textAlign: TextAlign.center),
                          ),
                          ListTile(
                            title: Text('웹 개발', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebScreen()));
                            },
                          ),
                          ListTile(
                            title:
                                Text('모바일 앱 개발', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppScreen()));
                            },
                          ),
                          ListTile(
                            title:
                                Text('프로그래밍 언어', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProgrammingScreen()));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Color(0xFF0DCE9F),
                            title: Text('보안 네트워크', textAlign: TextAlign.center),
                          ),
                          ListTile(
                            title: Text('보안', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecurityScreen()));
                            },
                          ),
                          ListTile(
                            title: Text('자동화', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AutoMationScreen()));
                            },
                          ),
                          ListTile(
                            title: Text('인프라', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InfraScreen()));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Color(0xFF0DCE9F),
                            title:
                                Text('데이터 사이언스', textAlign: TextAlign.center),
                          ),
                          ListTile(
                            title: Text('데이터 분석', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DataAnalysisScreen()));
                            },
                          ),
                          ListTile(
                            title: Text('인공지능', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AiScreen()));
                            },
                          ),
                          ListTile(
                            title: Text('데이터베이스', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DatabaseScreen()));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Color(0xFF0DCE9F),
                            title: Text('웹/앱 디자인', textAlign: TextAlign.center),
                          ),
                          ListTile(
                            title: Text('웹 퍼블리싱', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PublishingScreen()));
                            },
                          ),
                          ListTile(
                            title: Text('웹 디자인', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DesignScreen()));
                            },
                          ),
                          ListTile(
                            title: Text('반응형 웹 ', textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResponsiveScreen()));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
