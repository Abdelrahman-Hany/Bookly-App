import 'package:bookly_app/core/utlis/assets.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.25,
      child: AspectRatio(
        aspectRatio: 2/3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            image:const DecorationImage(image: AssetImage(AssetsData.testImage),fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}