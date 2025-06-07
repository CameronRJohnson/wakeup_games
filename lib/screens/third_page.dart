import 'dart:math';

import 'package:flutter/material.dart';

import 'home.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Color _firstButtonColor = Colors.blue;
  Color _secondButtonColor = Colors.blue;
  Color _thirdButtonColor = Colors.blue;
  Color _fourthButtonColor = Colors.blue;
  Color _fifthButtonColor = Colors.blue;
  Color _sixButtonColor = Colors.blue;
  Color _seventhButtonColor = Colors.blue;
  Color _eighthButtonColor = Colors.blue;
  Color _ninthButtonColor = Colors.blue;

  Color _backgroundColor = Colors.black87;

  late var lst = List.filled(9, 0);
  late var answerLis = List.filled(9, 0);

  int scoreTime = 1000;
  int currentScore = 0;

  screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  box() {
    return SizedBox(
      width: 50,
      height: 100,
    );
  }

  navBack() {
    return TextButton(
      child: Text("Go to home page"),
      onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home())),
    );
  }

  goButton() {
    return TextButton(
        onPressed: () async {
          answerLis[0] = 0;
          answerLis[1] = 0;
          answerLis[2] = 0;
          answerLis[3] = 0;
          answerLis[4] = 0;
          answerLis[5] = 0;
          answerLis[6] = 0;
          answerLis[7] = 0;
          answerLis[8] = 0;

          lst[0] = Random().nextInt(2);
          lst[1] = Random().nextInt(2);
          lst[2] = Random().nextInt(2);
          lst[3] = Random().nextInt(2);
          lst[4] = Random().nextInt(2);
          lst[5] = Random().nextInt(2);
          lst[6] = Random().nextInt(2);
          lst[7] = Random().nextInt(2);
          lst[8] = Random().nextInt(2);

          // First Button
          if (lst[0] == 1) {
            setState(() {
              _firstButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _firstButtonColor = Colors.blue;
            });
          } else if (lst[0] == 0) {
            setState(() {
              _firstButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _firstButtonColor = Colors.blue;
            });
          }

          // Second Button
          if (lst[1] == 1) {
            setState(() {
              _secondButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _secondButtonColor = Colors.blue;
            });
          } else if (lst[1] == 0) {
            setState(() {
              _secondButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _secondButtonColor = Colors.blue;
            });
          }

          // Third Button
          if (lst[2] == 1) {
            setState(() {
              _thirdButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _thirdButtonColor = Colors.blue;
            });
          } else if (lst[2] == 0) {
            setState(() {
              _thirdButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _thirdButtonColor = Colors.blue;
            });
          }

          // Fourth Button
          if (lst[3] == 1) {
            setState(() {
              _fourthButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _fourthButtonColor = Colors.blue;
            });
          } else if (lst[3] == 0) {
            setState(() {
              _fourthButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _fourthButtonColor = Colors.blue;
            });
          }

          // Fifth Button
          if (lst[4] == 1) {
            setState(() {
              _fifthButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _fifthButtonColor = Colors.blue;
            });
          } else if (lst[4] == 0) {
            setState(() {
              _fifthButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _fifthButtonColor = Colors.blue;
            });
          }

          // Six Button
          if (lst[5] == 1) {
            setState(() {
              _sixButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _sixButtonColor = Colors.blue;
            });
          } else if (lst[5] == 0) {
            setState(() {
              _sixButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _sixButtonColor = Colors.blue;
            });
          }

          // Seventh Button
          if (lst[6] == 1) {
            setState(() {
              _seventhButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _seventhButtonColor = Colors.blue;
            });
          } else if (lst[6] == 0) {
            setState(() {
              _seventhButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _seventhButtonColor = Colors.blue;
            });
          }

          // Eightth Button
          if (lst[7] == 1) {
            setState(() {
              _eighthButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _eighthButtonColor = Colors.blue;
            });
          } else if (lst[7] == 0) {
            setState(() {
              _eighthButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _eighthButtonColor = Colors.blue;
            });
          }

          // Ninth Button
          if (lst[8] == 1) {
            setState(() {
              _ninthButtonColor = Colors.green;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _ninthButtonColor = Colors.blue;
            });
          } else if (lst[8] == 0) {
            setState(() {
              _ninthButtonColor = Colors.red;
            });
            await Future.delayed(Duration(milliseconds: scoreTime));
            setState(() {
              _ninthButtonColor = Colors.blue;
            });
          }
        },
        child: Text('GO'));
  }

  firstButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_firstButtonColor)),
        onPressed: () async {
          answerLis[0] = 1;
          setState(() {
            _firstButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _firstButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  secondButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_secondButtonColor)),
        onPressed: () async {
          answerLis[1] = 1;
          setState(() {
            _secondButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _secondButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  thirdButtun() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_thirdButtonColor)),
        onPressed: () async {
          answerLis[2] = 1;
          setState(() {
            _thirdButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _thirdButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  fourthButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_fourthButtonColor)),
        onPressed: () async {
          answerLis[3] = 1;
          setState(() {
            _fourthButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _fourthButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  fifthButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_fifthButtonColor)),
        onPressed: () async {
          answerLis[4] = 1;
          setState(() {
            _fifthButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _fifthButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  sixButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_sixButtonColor)),
        onPressed: () async {
          answerLis[5] = 1;
          setState(() {
            _sixButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _sixButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  seventhButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_seventhButtonColor)),
        onPressed: () async {
          answerLis[6] = 1;
          setState(() {
            _seventhButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _seventhButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  eightthButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_eighthButtonColor)),
        onPressed: () async {
          answerLis[7] = 1;
          setState(() {
            _eighthButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _eighthButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  ninthButton() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_ninthButtonColor)),
        onPressed: () async {
          answerLis[8] = 1;
          setState(() {
            _ninthButtonColor = Colors.green;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _ninthButtonColor = Colors.blue;
          });
        },
        child: Text(''));
  }

  answerButton() {
    return TextButton(
        onPressed: () async {
          if (answerLis[0] == lst[0] &&
              answerLis[1] == lst[1] &&
              answerLis[2] == lst[2] &&
              answerLis[3] == lst[3] &&
              answerLis[4] == lst[4] &&
              answerLis[5] == lst[5] &&
              answerLis[6] == lst[6] &&
              answerLis[7] == lst[7] &&
              answerLis[8] == lst[8]) {
            currentScore += 1;
            if (currentScore < 5) {
              scoreTime -= 150;
            }
            setState(() {
              _backgroundColor = Colors.green;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              _backgroundColor = Colors.black87;
            });
          } else {
            scoreTime = 1000;
            currentScore = 0;
            setState(() {
              _backgroundColor = Colors.red;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              _backgroundColor = Colors.black87;
            });
          }
        },
        child: Text('Check Answer'));
  }

  smallBox() {
    return SizedBox(
      width: 20,
      height: 20,
    );
  }

  scoreText() {
    return Text(
      "$currentScore",
      style: TextStyle(fontSize: screenHeight() / 20, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: const Text("Memorizing Game"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              goButton(),

              // First Row
              Row(
                children: [
                  firstButton(),
                  box(),
                  secondButton(),
                  box(),
                  thirdButtun()
                ],
              ),

              // Second Row
              Row(
                children: [
                  fourthButton(),
                  box(),
                  fifthButton(),
                  box(),
                  sixButton()
                ],
              ),

              // Third Row
              Row(
                children: [
                  seventhButton(),
                  box(),
                  eightthButton(),
                  box(),
                  ninthButton()
                ],
              ),

              scoreText(),
              smallBox(),
              answerButton(),
              navBack(),
            ],
          ),
        ],
      ),
    );
  }
}
