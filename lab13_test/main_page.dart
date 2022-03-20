import 'package:flutter/material.dart';
import './quiz_data.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TEst',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProblemsInfo(),
      ),
    );
  }
}
