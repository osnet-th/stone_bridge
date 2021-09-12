import 'package:flutter/material.dart';
import 'package:stone_bridge_app/comunity/allScreen.dart';
import 'package:stone_bridge_app/comunity/freeScreen.dart';
import 'package:stone_bridge_app/comunity/load/newload.dart';
import 'package:stone_bridge_app/comunity/popularScreen.dart';
import 'package:stone_bridge_app/comunity/productScreen.dart';
import 'package:stone_bridge_app/comunity/shareScreen.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  TextEditingController editingController = TextEditingController();
  final List<Tab> myTabs = <Tab>[
    Tab(text: '전체'),
    Tab(text: '인기게시글'),
    Tab(text: '자유게시판'),
    Tab(text: '작품'),
    Tab(text: '정보공유'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    refreshList();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          isScrollable: true,
          indicatorWeight: 4.0,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          controller: _tabController,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AllScreen(),
          PopularScreen(),
          FreeScreen(),
          ProductScreen(),
          ShareScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewLoadScreen()))
              .then((value) {
            if (value == true) {
              setState(() {
                // refresh page 1 here, you may want to reload your SharedPreferences here according to your needs
              });
            }
          });
        },
        tooltip: 'add',
        child: Icon(Icons.note_alt_outlined),
        backgroundColor: Color(0xFF0DCE9F),
      ),
    );
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0)); //thread sleep 같은 역할을 함.
    //새로운 정보를 그려내는 곳

    return null;
  }
}
