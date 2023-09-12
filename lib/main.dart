import 'package:flutter/material.dart';
import 'package:onboarding_screens/onboarding.dart';

void main() {
  runApp(
    const OnboardingPages(),
  );
}

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const Onboarding(),
    );
  }
}
