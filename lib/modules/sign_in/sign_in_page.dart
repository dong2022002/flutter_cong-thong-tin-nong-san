import 'package:cttns/components/login_widget/rounded_button.dart';
import 'package:cttns/components/login_widget/rounded_text_field.dart';
import 'package:cttns/modules/sign_in/sign_in_store.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage(
      {super.key, required this.onPress, required this.goToAccount});
  final VoidCallback onPress;
  final VoidCallback goToAccount;
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late var store;

  @override
  void initState() {
    super.initState();
    store = SignInStore(widget.goToAccount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ScopedBuilder<SignInStore, SignInModel>(
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
                  // Text(
                  //   'Welcome',
                  //   style: TextStyle(fontSize: 20, color: AppColors.foreground),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Đăng nhập',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32,
                            color: AppColors.foreground,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 42, bottom: 8),
                    child: RoundedTextField(
                      controller: state.usernameController,
                      hintText: 'Tài khoản',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      password: true,
                      hintText: 'Mật khẩu',
                    ),
                  ),
                  TextButton(
                    onPressed: store.forgetPassword,
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.foreground,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: RoundedButton(
                        onPress: store.signIn, label: 'Đăng nhập'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                  //   child: RoundedButton(
                  //       onPress: store.signInWithGoogle,
                  //       label: 'Đăng nhập với Google'),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Bạn chưa có tài khoản ?'),
                      TextButton(
                        onPressed: widget.onPress,
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(color: AppColors.foregroundDark),
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
