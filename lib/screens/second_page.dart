import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final myController = TextEditingController();
  late SharedPreferences _storage;
  late Future<void> _future;

  int _start = 10;
  int currentScore = 0;
  int firstNumber = Random().nextInt(10);
  int secondNumber = Random().nextInt(10);
  int operaterNumber = Random().nextInt(2);

  Color myColor = Colors.amber;
  late Timer _timer;

  String randomOP = '';

  @override
  void initState() {
    super.initState();
    _future = _compute();
  }

  Future<void> _compute() async {
    _storage = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
    _timer.cancel();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            currentScore = 0;
            _start = 10;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  headText() {
    return Padding(
      padding: EdgeInsets.only(
          top: screenHeight() / 15, bottom: screenHeight() / 10),
      child: Text(
        'Answer The Equation As Fast As Possible',
        style: TextStyle(fontSize: screenHeight() / 40),
      ),
    );
  }

  timeLeftText() {
    return Text(
      ' Time: $_start',
      style: TextStyle(fontSize: screenHeight() / 15),
    );
  }

  myScoreText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight() / 50),
      child: Text(
        '$currentScore',
        style: TextStyle(fontSize: screenHeight() / 15),
      ),
    );
  }

  equation() {
    if (operaterNumber == 1) {
      randomOP = '+';
    } else if (operaterNumber == 0) {
      randomOP = '-';
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight() / 50),
      child: Text(
        '$firstNumber $randomOP $secondNumber = ',
        style: TextStyle(fontSize: screenHeight() / 15),
      ),
    );
  }

  answer() {
    return SizedBox(
      width: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: screenHeight() / 15),
        controller: myController,
      ),
    );
  }

  answerButton() {
    int high = _storage.getInt('HighScore') ?? 0;
    return Padding(
      padding: EdgeInsets.only(
          bottom: screenHeight() / 10, top: screenHeight() / 40),
      child: ElevatedButton(
          child: Text(
            'Enter',
            style: TextStyle(fontSize: screenHeight() / 20),
          ),
          onPressed: () async {
            if (_start == 10) {
              startTimer();
            }
            try {
              if (randomOP == '+') {
                if (firstNumber + secondNumber ==
                    int.parse(myController.text)) {
                  setState(() {
                    myColor = Colors.green;
                    firstNumber = Random().nextInt(10);
                    secondNumber = Random().nextInt(10);
                    operaterNumber = Random().nextInt(2);
                    currentScore += 1;
                    if (high < currentScore) {
                      _storage.setInt('HighScore', currentScore);
                    }
                  });
                  myController.clear();
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    myColor = Colors.amber;
                  });
                } else if (firstNumber + secondNumber !=
                    int.parse(myController.text)) {
                  operaterNumber = Random().nextInt(2);
                  setState(() {
                    myColor = Colors.red;
                  });
                  myController.clear();
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    myColor = Colors.amber;
                  });
                }
              } else if (randomOP == '-') {
                if (firstNumber - secondNumber ==
                    int.parse(myController.text)) {
                  setState(() {
                    myColor = Colors.green;
                    firstNumber = Random().nextInt(10);
                    secondNumber = Random().nextInt(10);
                    operaterNumber = Random().nextInt(2);
                    currentScore += 1;
                    if (high < currentScore) {
                      _storage.setInt('HighScore', currentScore);
                    }
                  });
                  myController.clear();
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    myColor = Colors.amber;
                  });
                } else if (firstNumber - secondNumber !=
                    int.parse(myController.text)) {
                  operaterNumber = Random().nextInt(2);
                  setState(() {
                    myColor = Colors.red;
                  });
                  myController.clear();
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    myColor = Colors.amber;
                  });
                }
              }
            } catch (e) {}
          }),
    );
  }

  navitageToPrevious() {
    return TextButton(
      child: Text(
        "Back To Main Menu",
        style: TextStyle(fontSize: screenHeight() / 40),
      ),
      onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home())),
    );
  }

  textAnswer() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      '${firstNumber + secondNumber}',
      style: TextStyle(fontSize: screenWidth / 40),
    );
  }

  highScoreText() {
    return Text(
      'HighScore: ${_storage.getInt('HighScore') ?? 0}',
      style: TextStyle(fontSize: screenHeight() / 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: myColor,
            body: Column(
              children: [
                headText(),
                timeLeftText(),
                myScoreText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [equation(), answer()],
                ),
                answerButton(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    navitageToPrevious(),
                    // textAnswer(),
                    highScoreText(),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
