import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  var _isCheck = [false, false, false];
  var _price = [300, 100, 150];
  int _sum = 0;
  var _quantity = [8, 9, 5];
  double cardHeight = 300;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset('video/video.mp4');

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
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
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: ListView(children: [
        video(),
        SizedBox(
          height: 20,
        ),
        text('스프링의 원리부터 핵심 가치까지', 20, true),
        SizedBox(
          height: 20,
        ),
        text('순수 자바부터 스트링에 이르기까지 -', 20, true),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _card("image/java.jpg"),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.more_horiz,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              _card("image/oop.jpg"),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.more_horiz,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              _card("image/tree.jpg"),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        text(
            '직접 순수한 자바 코드로 예제 애플리케이션을 따라 만들어\n스프링이 왜 만들어졌는지, 핵심은 무엇인지를\n자연스럽게 깨닫고 이해하게 됩니다.',
            10,
            true),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: text(
              '단순히 스프링이 제공하는 기능을 배우고 사용하는 것은 어렵지 않습니다. 스프링이 제공하는 핵심 가치에 원리를제대로 이해하는 것이 어렵죠. 객체 지향의 설계의 원칙까지 쉽게 이해해야 비로소 스프링의 핵심을 파악할 수 있기 때문입니다.지금부터, 이 강의만 잘 따라해주세요. 확실하게 성장할 것이라고 보장합니다.',
              15,
              true),
        ),
        SizedBox(
          height: 20,
        ),
        text('강의 구성', 25, true),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          width: 100,
          child: Image.asset(
            "image/hak.jpg",
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _box1(),
          SizedBox(
            width: 10,
          ),
          _box2()
        ]),
        SizedBox(
          height: 20,
        ),
        text('강의 대상', 25, true),
        SizedBox(
          height: 20,
        ),
        _lectureTarget(),
        SizedBox(
          height: 20,
        ),
        text('추천 기자재', 25, true),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 290,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 0.5)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _equipment('image/notebook.jpg', '노트북', 0),
                    SizedBox(
                      width: 15,
                    ),
                    _equipment('image/arduino.jpg', '아두이노', 1),
                    SizedBox(
                      width: 15,
                    ),
                    _equipment('image/raspi.jpg', '라즈베리파이', 2),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  child: text('총 비용 $_sum', 25, true),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightGreen,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5)
              ],
            )),
        SizedBox(
          height: 5,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _button('카트에 담기'),
          SizedBox(
            width: 10,
          ),
          _button('대여하기'),
        ]),
        SizedBox(
          height: 20,
        ),
        text('이 강의는 어떠세요?', 25, true),
        SizedBox(height: 20),
        newLectures(),
      ]),
    );
  }

  Widget video() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_controller),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Positioned(
          child: FloatingActionButton(
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(() {
                // If the video is playing, pause it.
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  // If the video is paused, play it.
                  _controller.play();
                }
              });
            },
            // Display the correct icon depending on the state of the player.
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
          right: 0,
          left: 0,
          bottom: 80,
        ),
      ],
    );
  }

  Widget text(String text, double fontsize, bool center) {
    return Center(
      child: center
          ? Text(
              text,
              style: TextStyle(
                fontSize: fontsize,
              ),
              textAlign: TextAlign.center,
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: fontsize,
              ),
            ),
    );
  }

  Widget _card(String image) {
    return Center(
      child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          )),
    );
  }

  Widget _box1() {
    return Container(
      height: 150,
      width: 150,
      child: Center(
        child: text('이런걸\n배워요!', 20, true),
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
    );
  }

  Widget _box2() {
    return Container(
      height: 150,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('스프링의 기본', textAlign: TextAlign.right),
          SizedBox(
            height: 5,
          ),
          Text('스프링의 핵심원리', textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),
          Text('객체 지향 설계', textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),
          Text('스프링의 심화 개념', textAlign: TextAlign.left),
        ],
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
    );
  }

  Widget _lectureTarget() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 100,
              width: 80,
              child: Column(children: [
                Image.asset('image/checkBox.jpg'),
                Text('스프링을 처음 접하는 개발자',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
              ])),
          SizedBox(
            width: 20,
          ),
          Container(
              height: 100,
              width: 80,
              child: Column(children: [
                Image.asset('image/checkBox.jpg'),
                Text('스프링 핵심원리를 이해하고픈 개발자',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
              ])),
          SizedBox(
            width: 20,
          ),
          Container(
              height: 100,
              width: 80,
              child: Column(children: [
                Image.asset('image/checkBox.jpg'),
                Text('객체지향 설계가 고민인 개발자',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
              ])),
        ],
      ),
    );
  }

  Widget _equipment(String image, String name, int index) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.asset(image),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Checkbox(
            value: _isCheck[index],
            onChanged: (value) {
              setState(() {
                _isCheck[index] = value!;
                if (_isCheck[index])
                  _sum += _price[index];
                else
                  _sum -= _price[index];
              });
            },
          ),
          Text('남은 수량: ${_quantity[index]}',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 5,
          ),
          Text('가격 : ${_price[index]}',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  Widget _button(String title) {
    return Container(
      width: 100,
      child: ElevatedButton(
          child: Text(title, style: TextStyle(fontSize: 14)),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Color(0xFF0DCE9F))))),
          onPressed: () => null),
    );
  }

  Widget newLectures() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
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
    );
  }
}
