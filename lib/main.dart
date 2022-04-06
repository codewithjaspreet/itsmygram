import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ItsMyGram',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Text(
          'Lets build Itsmygram',
        ),
      ),
    );
  }
}
