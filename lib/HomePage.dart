import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:is_2020_end/animated_flip_counter.dart';

class MyHomePage extends StatefulWidget {
  final now = DateTime.now();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int deviceYear;
  int targetYear = 2021;
  String answer;
  int countdown = 0;

  @override
  void initState() {
    super.initState();
    var yearFormatter = DateFormat('y').format(widget.now);
    deviceYear = int.parse(yearFormatter);
  }

  bool checkYear() {
    return deviceYear > targetYear ? true : false;
  }

  int findDifference() =>
      widget.now.difference(DateTime(targetYear + 1)).inDays;

  void incrementNumber() {
    for (var i = 1; i < findDifference(); i++) {
      setState(() {
        countdown = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        countdown = findDifference();
      });
    });
    answer = checkYear() ? 'Yes.' : 'Not yet :")';
    incrementNumber();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Is ',
                    style: TextStyle(fontSize: 35),
                    children: <TextSpan>[
                      TextSpan(
                          text: targetYear.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' end?'),
                    ],
                  ),
                ),
                // child: Text(
                //   'Is $targetYear end?',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 35,
                //   ),
                // ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    answer,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !checkYear()
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: AnimatedFlipCounter(
                            value: countdown,
                            color: Colors.white,
                            duration: Duration(
                                seconds: findDifference() < 100 ? 4 : 7),
                            size: 85,
                          ),
                        )
                      : Container(),
                  !checkYear()
                      ? Text(
                          'days left',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
