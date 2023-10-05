import 'package:crop_disease_detection/constants/constants.dart';
import 'package:crop_disease_detection/screens/login_screen.dart';
import 'package:crop_disease_detection/screens/main_screen.dart';
import 'package:crop_disease_detection/screens/widgets/CustomPrimaryButton.dart';
import 'package:crop_disease_detection/screens/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signup.png'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const CustomTextField(
                icon: Icons.alternate_email,
                obscureText: false,
                hintText: 'Enter Email',
              ),
              const CustomTextField(
                icon: Icons.person,
                obscureText: false,
                hintText: 'Enter Full Name',
              ),
              const CustomTextField(
                icon: Icons.lock,
                obscureText: true,
                hintText: 'Enter Password',
              ),
              const CustomTextField(
                icon: Icons.lock,
                obscureText: true,
                hintText: 'Confirm Password',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomPrimaryButton(
                size: size,
                title: "Sign Up",
                screen: const MainScreen(),
              ),

              //

              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text("OR"),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/google.png'),
                    ),
                    Text(
                      "Sign Up with Google",
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),

              //

              const SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const LoginScreen(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an Account? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
