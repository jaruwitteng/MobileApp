import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void alertMsg(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Flight Booked Successful"),
      content: Text("Have a pleasent flight"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              textDirection: TextDirection.ltr,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jaruwit Tengsujaritgul",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink),
                  ),
                ),
                Text("",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
                Text("Photo credit:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
                Text("",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
              ],
            ),
            Column(
              children: const [
                Text("623040185-6",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
                Text("Student",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
                Text("Frank",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
                Text("Ocean",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink)),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
        ),
        Image.asset("assets/frank.jpeg"),
        Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text("Book your flight",
                  style: TextStyle(color: Colors.pink)),
              onPressed: () => {alertMsg(context)}),
        )
      ],
    );
  }
}
