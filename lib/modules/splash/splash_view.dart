import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/icons/splash_ic.svg'),
      ),
    );
  }
}
