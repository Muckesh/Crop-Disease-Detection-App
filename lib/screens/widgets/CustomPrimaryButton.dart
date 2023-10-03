// ignore: file_names
import 'package:crop_disease_detection/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.size,
    required this.title,
    required this.screen,
  });
  final String title;
  final Widget screen;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: screen,
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
