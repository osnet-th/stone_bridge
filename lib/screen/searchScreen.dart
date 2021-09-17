//flutter
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stone_bridge_app/search/all.dart';
import 'package:stone_bridge_app/search/equipment.dart';
import 'package:stone_bridge_app/search/lecture.dart';
import 'package:stone_bridge_app/search/mentor.dart';

//Stonebridge

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _search(),
            _tabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '검색',
          prefixIcon: Padding(
            padding: EdgeInsets.all(15),
            child: FaIcon(FontAwesomeIcons.search),
          ),
        ),
      ),
    );
  }

  Widget _tabBarView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DefaultTabController(
            length: 4, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: Color(0xFF0DCE9F),
                  child: TabBar(
                    indicatorColor: Color(0xffffffff),
                    indicatorPadding: EdgeInsets.only(bottom: 2),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(text: '전체'),
                      Tab(text: '기자재'),
                      Tab(text: '강의'),
                      Tab(text: '멘토'),
                    ],
                  ),
                ),
                Container(
                  height: 700, //height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                    children: <Widget>[
                      All(),
                      Equipment(),
                      Lecture(),
                      Mentor(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
