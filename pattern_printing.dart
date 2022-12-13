import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String getPattern(int n) {
  String pattern = "\n";
  for (int i = 1; i <= n; ++i) {
    // add n - i spaces
    for (int j = 1; j <= n - i; ++j) {
      pattern += " ";
    }
    // add 2i - 1 stars
    for (int j = 1; j <= 2*i - 1; ++j) {
      pattern += "*";
    }
    pattern += "\n";
  }
  return pattern;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pattern Printing",
          ),
          centerTitle: true,
        ),
        body: const PatternWidget(),
      )
    );
  }
}

class PatternWidget extends StatefulWidget {
  const PatternWidget({Key? key}) : super(key: key);

  @override
  State<PatternWidget> createState() => _PatternWidgetState();
}

class _PatternWidgetState extends State<PatternWidget> {
  String pattern = "";
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              try {
                n = int.parse(text);
              }
              catch(e) {
                n= 0;
              }
            },
          ),
          TextButton(
            onPressed: () {
              // print(getPattern(n));
              setState(() {
                pattern = getPattern(n);
              });
            },
            child: const Text("Generate Pattern"),
          ),
          Text(
            pattern,
            style: const TextStyle(
              fontSize: 25.0,
              fontFamily: "monospace",  // this is important!
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}



