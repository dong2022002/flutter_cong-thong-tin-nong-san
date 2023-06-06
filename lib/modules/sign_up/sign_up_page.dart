import 'package:cttns/components/login_widget/rounded_button.dart';
import 'package:cttns/components/login_widget/rounded_text_field.dart';
import 'package:cttns/modules/sign_up/sign_up_state.dart';
import 'package:cttns/modules/sign_up/sign_up_store.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final store = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ScopedBuilder<SignupStore, SignupState>(
        store: store,
        onState: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Create new  Account!',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.foreground,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Please fill in the form to continue',
                    style: TextStyle(
                        fontSize: 14, color: AppColors.foregroundDark),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 42, bottom: 8),
                    child: RoundedTextField(
                      controller: state.fnController,
                      hintText: 'First name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: RoundedTextField(
                      controller: state.lnController,
                      hintText: 'Last name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: RoundedTextField(
                      controller: state.emailController,
                      hintText: 'Email Address',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      hintText: 'Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      password: true,
                      hintText: 'Confirm Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child:
                        RoundedButton(onPress: store.signUp, label: 'Sign Up'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                  //   child: RoundedButton(
                  //       onPress: () {}, label: 'Sign In with Google'),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('You already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: AppColors.foreground),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        onError: (context, error) => Center(child: Text(error.toString())),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
