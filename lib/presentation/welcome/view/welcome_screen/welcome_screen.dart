import 'package:eduvibe/core/route/routes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome to Eduvibe'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.chatBotScreen);
              },
              child: const Text('chatBotScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.profileScreen);
              },
              child: const Text('profileScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.learnScreen);
              },
              child: const Text('learnScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.coursesScreen);
              },
              child: const Text('coursesScreen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.mainScreen);
        },
        child: Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
