import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RandomJokePage extends StatefulWidget {
  const RandomJokePage({super.key});

  @override
  State<RandomJokePage> createState() => _RandomJokePageState();
}

class _RandomJokePageState extends State<RandomJokePage> {
  Map<String, dynamic> randomJoke = {};  // This will hold the random joke data

  @override
  void initState() {
    super.initState();
    getRandomJoke();
  }

  void getRandomJoke() async {
    try {
      var joke = await ApiService.getRandomJoke();
      setState(() {
        randomJoke = joke;
      });
    } catch (e) {
      // Handle error here, for example:
      print("Error fetching random joke: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
        backgroundColor: Colors.blue,
      ),
      body: randomJoke.isEmpty
          ? const Center(child: CircularProgressIndicator())  // Show loading spinner
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              randomJoke['setup'] ?? 'No setup available',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              randomJoke['punchline'] ?? 'No punchline available',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
