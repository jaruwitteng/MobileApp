import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  bool _lightIsOn = false;
  bool _lightIsOn2 = false;
  bool _lightIsOn3 = false;
  bool _lightIsOn4 = false;

  late String choice1;
  late String choice2;
  late String choice3;
  late String choice4;
  late String answer;

  late String title;
  late String imgUrl;
  bool previous = false;
  bool color = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(15),
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
                          const snackBar = SnackBar(content: Text(''));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Toggle light when tapped.
                          _lightIsOn = !_lightIsOn;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Data(choice1, ""),
                        color: _lightIsOn ? Colors.purpleAccent : Colors.red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          const snackBar = SnackBar(content: Text(''));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Toggle light when tapped.
                          _lightIsOn3 = !_lightIsOn3;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Data(choice3, ""),
                        color: _lightIsOn3 ? Colors.blue : Colors.red,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle light when tapped.
                          const snackBar = SnackBar(content: Text(''));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          _lightIsOn2 = !_lightIsOn2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Data(choice2, ""),
                        color:
                            _lightIsOn2 ? Colors.lightBlueAccent : Colors.red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          const snackBar = SnackBar(content: Text(''));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Toggle light when tapped.
                          _lightIsOn4 = !_lightIsOn4;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Data(choice4, ""),
                        color:
                            _lightIsOn4 ? Colors.yellow.shade600 : Colors.green,
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
                  child: Text('Home'),
                )),
                Visibility(
                    visible: nextProb != null,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => nextProb ?? Container()),
                      ),
                      child: Text('next'),
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
  @override
  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: displayHeight(context) * 0.1,
      width: displayWidth(context) * 0.4,
      child: Text(name,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black)),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            'https://www.clipartmax.com/png/full/343-3432912_quiz-tips-icon-icon.png',
            height: 200,
            width: 200,
          ),
          Text(
            "Welcome to the Quiz App",
            style: TextStyle(fontSize: 30, color: Colors.pinkAccent),
          ),
          Text(
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
            child: Text('Start'),
          )),
        ],
      )),
    );
  }
}
