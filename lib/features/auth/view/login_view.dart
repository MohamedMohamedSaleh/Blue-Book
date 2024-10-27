import 'package:blue_book/core/constants/colors.dart';
import 'package:blue_book/core/widgets/custom_app_input.dart';
import 'package:blue_book/features/auth/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import '../../../core/widgets/custom_filled_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final cubit = KiwiContainer().resolve<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
                child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autovalidateMode,
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
                  CustomAppInput(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please Enter User Name';
                      }
                      return null;
                    },
                    controller: cubit.userNameController,
                    labelText: 'User Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAppInput(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    labelText: 'Password',
                    isPassword: true,
                    controller: cubit.passwordController,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      return CustomFilledButton(
                          isLoading: state is LoginLoadingState,
                          title: 'Login',
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (!cubit.formKey.currentState!.validate()) {
                              cubit.autovalidateMode =
                                  AutovalidateMode.onUserInteraction;
                              setState(() {});
                              return;
                            }
                            cubit.login();
                          });
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
