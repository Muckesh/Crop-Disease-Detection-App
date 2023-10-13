import 'package:crop_disease_detection/screens/detection_screen.dart';
import 'package:crop_disease_detection/screens/widgets/CustomBanner.dart';
import 'package:crop_disease_detection/screens/widgets/CustomPrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void plantHealthCheckScreen() {}

  void cropDiseaseCheckScreen() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomBanner(
              img: 'assets/images/plant-one.png',
              primaryTitle: 'Welcome Back!',
              secondaryTitle: "Alexander",
            ),
            const SizedBox(
              height: 20,
            ),
            //
            // CustomPrimaryButton(
            //   size: size,
            //   title: 'Plant Health Check',
            //   // screen: const PlantHealthCheckScreen(),
            //   onTap: plantHealthCheckScreen,
            // ),
            //
            const SizedBox(
              height: 20,
            ),
            CustomPrimaryButton(
              size: size,
              title: "Crop Disease Check",
              // screen: const CropDiseaseCheckScreen(),
              // onTap: cropDiseaseCheckScreen,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: DetectionScreen(),
                      type: PageTransitionType.bottomToTop),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
