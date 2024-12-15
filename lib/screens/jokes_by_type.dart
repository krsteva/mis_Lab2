import 'package:flutter/material.dart';
import '../services/api_service.dart';

class JokesByTypePage extends StatefulWidget {
  const JokesByTypePage({super.key});

  @override
  State<JokesByTypePage> createState() => _JokesByTypePageState();
}

class _JokesByTypePageState extends State<JokesByTypePage> {
  List<Map<String, dynamic>> jokes = [];
  String type = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    type = arguments;
    getJokesByType();
  }

  void getJokesByType() async {
    ApiService.getJokesByType(type).then((response) {
      setState(() {
        jokes = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type),  // Display type name in the app bar
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jokes[index]['setup']),
            subtitle: Text(jokes[index]['punchline']),
          );
        },
      ),
    );
  }
}
