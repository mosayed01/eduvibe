import 'package:flutter/material.dart';

import '../../../core/route/routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Onboarding Screen',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.welcomeScreen);
        },
        child: Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
