//flutter
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stone_bridge_app/camera/camera.dart';

//스톤브릿지
import 'package:stone_bridge_app/screen/categoryScreen.dart';
import 'package:stone_bridge_app/screen/communityScreen.dart';
import 'package:stone_bridge_app/screen/homeScreen.dart';
import 'package:stone_bridge_app/screen/loginScreen.dart';
import 'package:stone_bridge_app/screen/profileScreen.dart';
import 'package:stone_bridge_app/screen/searchScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stonebridge',
      theme: ThemeData(
        primaryColor: Color(0xFF0DCE9F),
        unselectedWidgetColor: Color(0xFF0DCE9F),
      ),
      initialRoute: '/main',
      routes: {'/main': (context) => StoneBridge()},
    );
  }
}

class StoneBridge extends StatefulWidget {
  @override
  _StoneBridgeState createState() => _StoneBridgeState();
}

class _StoneBridgeState extends State<StoneBridge> {
  int _selectedScreen = 2;
  List<Widget> _bodyScreen = [
    CategoryScreen(),
    SearchScreen(),
    HomeScreen(),
    CommunityScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.home),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/main'),
        ),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.camera), onPressed: () {}),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.user),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
          ),
        ],
        title: Text('스톤브릿지'),
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: _bodyScreen[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF0DCE9F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: _selectedScreen,
        onTap: (int index) {
          setState(() {
            _selectedScreen = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '카테고리',
            icon: FaIcon(FontAwesomeIcons.bars),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: FaIcon(FontAwesomeIcons.search),
          ),
          BottomNavigationBarItem(
            label: '홈',
            icon: FaIcon(FontAwesomeIcons.home),
          ),
          BottomNavigationBarItem(
            label: '커뮤니티',
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
          ),
        ],
      ),
    );
  }
}
