import 'package:crop_disease_detection/screens/crop_disease_check_screen.dart';
import 'package:crop_disease_detection/screens/plant_health_check_screen.dart';
import 'package:crop_disease_detection/screens/widgets/CustomBanner.dart';
import 'package:crop_disease_detection/screens/widgets/CustomPrimaryButton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              secondaryTitle: "Username",
            ),
            const SizedBox(
              height: 20,
            ),
            //
            CustomPrimaryButton(
              size: size,
              title: 'Plant Health Check',
              screen: const PlantHealthCheckScreen(),
            ),
            //
            const SizedBox(
              height: 20,
            ),
            CustomPrimaryButton(
              size: size,
              title: "Crop Disease Check",
              screen: const CropDiseaseCheckScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
