import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './global.dart';

import './quiz_data.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key, required this.num, required this.info})
      : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String userChoice = "0";
  String dialogtitle = 'You right';
  String dialogtext = 'You got 1 point.';
  bool answerClicked = false;
  bool quizEnding = false;
  bool respon1 = false;
  bool respon2 = false;
  bool respon3 = false;
  bool respon4 = false;
  bool answerColor = false;

  late String choice1;
  late String choice2;
  late String choice3;
  late String choice4;
  late String answer;
  late final Color? color1;

  Color c1 = Colors.blue;
  Color c2 = Colors.blueAccent;
  Color c3 = Colors.purpleAccent;
  Color c4 = Colors.yellowAccent;
  Color rightWrong = Colors.green;

  late String title;
  late String imgUrl;
  bool previous = false;
  Widget? nextProb;

  @override
  void initState() {
    super.initState();
    choice1 = widget.info[widget.num]['choice1'];
    choice2 = widget.info[widget.num]['choice2'];
    choice3 = widget.info[widget.num]['choice3'];
    choice4 = widget.info[widget.num]['choice4'];
    answer = widget.info[widget.num]['answer'];
    title = widget.info[widget.num]['title'];
    imgUrl = widget.info[widget.num]['imgUrl'];

    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = true;
    }
    if (widget.num < widget.info.length) {
      nextProb = Quiz(num: widget.num + 1, info: widget.info);
    }
  }

  void answerCheck() {
    answerColor = true;
    if (userChoice == answer) {
      totalScore = totalScore + 1;
      print(totalScore);
      rightWrong = Colors.green;
      dialogtitle = 'You right';
      dialogtext = 'You got 1 point.';
    } else {
      rightWrong = Colors.red;
      dialogtitle = 'You wrong!!';
      dialogtext = 'Try again next time.';
    }

    _showDialog();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(dialogtitle),
          content: Text(dialogtext),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.num.toInt() == widget.info.length.toInt()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Result()),
                  );
                }

                if (widget.num.toInt() != widget.info.length.toInt()) {
                  print('wrong trigger');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => nextProb ?? Container()),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void resultShow() {
    const Result();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "Where is this picture?",
                  style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                )),
            Container(
              padding: const EdgeInsets.all(3),
            ),
            Image.network(imgUrl),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  textDirection: TextDirection.ltr,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          respon1 = true;
                          userChoice = "1";
                          answerCheck();
                          // Toggle light when tapped.
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Data(choice1, ""),
                        // color: _lightIsOn ? Colors.red : Colors.blue,
                        color: respon1 ? rightWrong : c1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          respon3 = true;
                          userChoice = "3";
                          answerCheck();
                          // Toggle light when tapped.
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Data(choice3, ""),
                        color: respon3 ? rightWrong : c3,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          respon2 = true;

                          userChoice = "2";
                          answerCheck();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Data(choice2, ""),
                        color: respon2 ? rightWrong : c2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          respon4 = true;
                          userChoice = "4";
                          answerCheck();
                          // Toggle light when tapped.
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Data(choice4, ""),
                        color: respon4 ? rightWrong : c4,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: previous,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Previous'),
                  ),
                ),
                Visibility(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: const Text('Home'),
                )),
                Visibility(
                    visible: nextProb != null,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => nextProb ?? Container()),
                      ),
                      child: const Text('next'),
                    ))
              ],
            )
          ],
        ));
  }
}

class Data extends StatelessWidget {
  final String name, bgcolor;
  const Data(this.name, this.bgcolor);
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      height: displayHeight(context) * 0.1,
      width: displayWidth(context) * 0.4,
      child: Text(name,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black)),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            'https://www.clipartmax.com/png/full/343-3432912_quiz-tips-icon-icon.png',
            height: 200,
            width: 200,
          ),
          const Text(
            "Welcome to the Quiz App",
            style: TextStyle(fontSize: 30, color: Colors.pinkAccent),
          ),
          const Text(
            "By Jaruwit Tengsujaritgul 623040185-6",
            style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
          ),
          Visibility(
              child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProblemsInfo()),
              );
            },
            child: const Text('Start'),
          )),
        ],
      )),
    );
  }
}

class Result extends StatelessWidget {
  static const routeName = './resultpage';
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Your score is ${totalScore}",
            style: TextStyle(fontSize: 50, color: Colors.pinkAccent),
          ),
          Visibility(
              child: ElevatedButton(
            onPressed: () {
              totalScore = 0;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProblemsInfo()),
              );
            },
            child: const Text('Restart'),
          )),
        ],
      )),
    );
  }
}
