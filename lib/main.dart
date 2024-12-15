import 'package:flutter/material.dart';
import 'package:lab_2/screens/home.dart';
import 'package:lab_2/screens/jokes_by_type.dart';
import 'package:lab_2/screens/random_joke.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/random': (context) => const RandomJokePage(),
        '/jokesByType': (context) => const JokesByTypePage(),
      },
    );
  }
}
