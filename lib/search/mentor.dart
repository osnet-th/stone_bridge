import 'package:flutter/material.dart';

class Mentor extends StatefulWidget {
  @override
  _Mentor createState() => _Mentor();
}

class _Mentor extends State<Mentor> {
  @override
  Widget build(BuildContext context) {
    return  Column(
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
