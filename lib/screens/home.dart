import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    ApiService.getJokeTypes().then((response) {
      setState(() {
        jokeTypes = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joke App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.casino, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/random'),  // Navigate to random joke page
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())  // Show loading spinner
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: jokeTypes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // When tapped, navigate to jokes screen for the selected type
              Navigator.pushNamed(
                context,
                '/jokesByType',
                arguments: jokeTypes[index],  // Pass the joke type as argument
              );
            },
            child: JokeCard(
              type: jokeTypes[index], // Joke type passed to the JokeCard widget
            ),
          );
        },
      ),
    );
  }
}
