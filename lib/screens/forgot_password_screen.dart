import 'package:crop_disease_detection/constants/constants.dart';
import 'package:crop_disease_detection/screens/signup_screen.dart';
import 'package:crop_disease_detection/screens/widgets/CustomPrimaryButton.dart';
import 'package:crop_disease_detection/screens/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailController = TextEditingController();

  void resetPassword() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/reset-password.png'),
              const Text(
                'Forgot \n Password ',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomTextField(
                icon: Icons.alternate_email,
                obscureText: false,
                hintText: 'Enter Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomPrimaryButton(
                size: size,
                title: "Reset Password",
                // screen: const LoginScreen(),
                onTap: resetPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: SignupScreen(),
                        type: PageTransitionType.bottomToTop),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
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
                    ]),
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
