import 'package:flutter/material.dart';

import 'home/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.deepPurple),
          bodyText2: TextStyle(color: Colors.deepPurple),
          headline1: TextStyle(color: Colors.deepPurple),
          headline2: TextStyle(color: Colors.deepPurple),
          headline3: TextStyle(color: Colors.deepPurple),
          headline4: TextStyle(color: Colors.deepPurple),
          headline5: TextStyle(color: Colors.deepPurple),
          headline6: TextStyle(color: Colors.deepPurple),
          subtitle1: TextStyle(color: Colors.deepPurple),
          subtitle2: TextStyle(color: Colors.deepPurple),
          button: TextStyle(color: Colors.deepPurple),
          caption: TextStyle(color: Colors.deepPurple),
          overline: TextStyle(color: Colors.deepPurple),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
          button: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.white),
          overline: TextStyle(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
