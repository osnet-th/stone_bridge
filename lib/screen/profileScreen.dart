//flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_bridge_app/login_state/loginController.dart';

//stonebridge

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final controller = Get.put(LoginController());
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) + 50);
  }

  @override
  Widget build(BuildContext context) {
    return Get.find<LoginController>().box == true
        ? Column(
            children: [
              Center(
                child: Text('로그인 되어있습니다.'),
              ),
              RaisedButton(
                onPressed: () {
                  Get.find<LoginController>().isLogout();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/main', (route) => false);
                },
                child: Text('Logout'),
              ),
            ],
          )
        : Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                  ),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('image/human_green.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '   홍길동',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      Text(
                        '     명지전문대학교, 3학년',
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 24, right: 24, top: 24, bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "내강의",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                                child: Text(
                                  "View all",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                onTap: () {}),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: GridView.count(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 24, right: 24),
                          crossAxisCount: 2,
                          childAspectRatio: findAspectRatio(
                              MediaQuery.of(context).size.width),
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image(
                                      image: AssetImage(
                                        'image/lake.jpg',
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      '코딩의 첫걸음',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text("★★"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image(
                                      image: AssetImage(
                                        'image/lake.jpg',
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      '순한 맛 코딩',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text("★★★★"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 24, right: 24, top: 24, bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "내강의",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                                child: Text(
                                  "View all",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                onTap: () {}),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: GridView.count(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 24, right: 24),
                          crossAxisCount: 2,
                          childAspectRatio: findAspectRatio(
                              MediaQuery.of(context).size.width),
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image(
                                      image: AssetImage(
                                        'image/lake.jpg',
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      '코딩의 첫걸음',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text("★★"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image(
                                      image: AssetImage(
                                        'image/lake.jpg',
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      '순한 맛 코딩',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text("★★★★"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
