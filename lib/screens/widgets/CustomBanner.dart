import 'package:crop_disease_detection/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String img;
  final String primaryTitle;
  final String secondaryTitle;
  const CustomBanner({
    super.key,
    required this.img,
    required this.primaryTitle,
    required this.secondaryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage(
            img,
          ),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                primaryTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                secondaryTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
