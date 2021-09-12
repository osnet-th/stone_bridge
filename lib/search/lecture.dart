import 'package:flutter/material.dart';

class Lecture extends StatefulWidget {
  @override
  _Lecture createState() => _Lecture();
}

class _Lecture extends State<Lecture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "인기검색어",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
