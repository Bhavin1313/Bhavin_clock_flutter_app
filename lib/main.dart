import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
// Divider(
// endIndent: MediaQuery.of(context).size.width * .95,
// color: (index % 5 == 0) ? Colors.red : Colors.grey,
// thickness: (index % 5 == 0) ? 7 : 4,
// ),
