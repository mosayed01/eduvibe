import 'dart:async';
import 'package:flutter/material.dart';

import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColors.primaryDark,
      body:  Center(
        child: Image(
          image: AssetImage(
            Assets.splash,
          ),
          height:250,
          width: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


}
