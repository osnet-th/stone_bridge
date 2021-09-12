import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

final imageList = [
  Image.asset('image2/main1.JPG', fit: BoxFit.fitHeight),
  Image.asset('image2/main2.JPG', fit: BoxFit.fitWidth),
  Image.asset('image2/main3.JPG', fit: BoxFit.cover),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String reason = '';

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  Widget _carousel() {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0, autoPlay: true),
      items: imageList.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: image,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _card() {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'image2/today1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
            ),
            Text(
              "ALPHAs1",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _card2() {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Image.asset(
              'image2/today2.jpg',
              fit: BoxFit.cover,
            ),
            Divider(
              height: 20,
              thickness: 5,
            ),
            Text(
              "DragonFly",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _carousel(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 9,
                            color: Color(0xFF0DCE9F),
                            icon: FaIcon(FontAwesomeIcons.circle),
                            onPressed: () {},
                          ),
                          Text(
                            '오늘의 인기 기자재',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _card(),
                        _card2(),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 9,
                            color: Color(0xFF0DCE9F),
                            icon: FaIcon(FontAwesomeIcons.circle),
                            onPressed: () {},
                          ),
                          Text(
                            '오늘의 기자재',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  child: Image.asset(
                                    'image2/today3.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 5,
                                ),
                                Text(
                                  ' Arduino Uno',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  child: Image.asset(
                                    'image2/today4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 5,
                                ),
                                Text(
                                  'Raspberry Pi',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 9,
                            color: Color(0xFF0DCE9F),
                            icon: FaIcon(FontAwesomeIcons.circle),
                            onPressed: () {},
                          ),
                          Text(
                            '멘토 인터뷰',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset(
                                  'image2/interview1.JPG',
                                  fit: BoxFit.cover,
                                ),
                                Divider(),
                                ListTile(
                                  title: Text('멘토'),
                                  trailing: Text('이태형'),
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                                ListTile(
                                  title: Text('(408) 555-1212',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  leading: Icon(
                                    Icons.phone,
                                    color: Colors.blue[500],
                                  ),
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                                ListTile(
                                  title: Text(
                                    'costa@example.com',
                                  ),
                                  leading: Icon(
                                    Icons.mail,
                                    color: Colors.blue[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset(
                                  'image2/interview2.JPG',
                                  fit: BoxFit.cover,
                                ),
                                Divider(),
                                ListTile(
                                  title: Text('멘토'),
                                  trailing: Text('이태형'),
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                                ListTile(
                                  title: Text('(408) 555-1212',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  leading: Icon(
                                    Icons.phone,
                                    color: Colors.blue[500],
                                  ),
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                                ListTile(
                                  title: Text('costa@example.com'),
                                  leading: Icon(
                                    Icons.contact_mail,
                                    color: Colors.blue[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
