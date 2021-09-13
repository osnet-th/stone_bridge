//flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_bridge_app/login_state/loginController.dart';
import 'package:stone_bridge_app/main.dart';

//stonebridge

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  late var name;
  late var grade;
  late var school;
  final controller = Get.put(LoginController());
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) + 50);
  }

  @override
  void initState() {
    super.initState();

    name = Get.find<LoginController>().name;
    grade = Get.find<LoginController>().grade;
    school = Get.find<LoginController>().school;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('image/human_green.png'),
                ),
                title: Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  grade,
                ),
                trailing: RaisedButton(
                  onPressed: () {
                    Get.find<LoginController>().isLogout();
                    Get.off(StoneBridge());
                  },
                  child: Text('Logout'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
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
                    childAspectRatio:
                        findAspectRatio(MediaQuery.of(context).size.width),
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
                                    fontSize: 15, fontWeight: FontWeight.w500),
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
                                    fontSize: 15, fontWeight: FontWeight.w500),
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
                  margin:
                      EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
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
                    childAspectRatio:
                        findAspectRatio(MediaQuery.of(context).size.width),
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
                                    fontSize: 15, fontWeight: FontWeight.w500),
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
                                    fontSize: 15, fontWeight: FontWeight.w500),
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
