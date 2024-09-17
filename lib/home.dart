import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String routeName='Home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('News App'),

      ),
    );
  }
}
