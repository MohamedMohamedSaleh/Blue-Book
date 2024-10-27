import 'package:blue_book/core/constants/colors.dart';
import 'package:blue_book/core/widgets/custom_app_input.dart';
import 'package:blue_book/features/show_video/view/show_video_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/widgets/custom_filled_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Lottie.asset(
                  'assets/lottie/login.json',
                  height: 200,
                ),
                const Text(
                  'Login To Continue',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Blue",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: " Book",
                        style: TextStyle(
                          color: myPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomAppInput(
                  labelText: 'User Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomAppInput(labelText: 'Password', isPassword: true),
                const SizedBox(
                  height: 80,
                ),
                CustomFilledButton(
                    title: 'Login',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowVideoView(),
                        ),
                      );
                    }),
                const SizedBox(height: 16),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
