import 'package:bookly_app/core/utlis/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});//we must make this constructor constant to improve app performance

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4,),
        const Text('Read Free Books',
        textAlign: TextAlign.center,
        ),
      ],
    );
  }
}