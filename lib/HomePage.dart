import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  final now = DateTime.now();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int phoneDate;
  int targetDate = 2020;
  String answer;

  @override
  void initState() {
    super.initState();
    var formatter = DateFormat('y').format(widget.now);
    phoneDate = int.parse(formatter);
  }

  bool checkYear() {
    return phoneDate > targetDate ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    answer = checkYear() ? 'Yes.' : 'Not yet.';

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Is 2020 end?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: Text(
                  answer,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
