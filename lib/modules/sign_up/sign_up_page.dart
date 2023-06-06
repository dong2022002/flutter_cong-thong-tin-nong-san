import 'package:cttns/components/login_widget/rounded_button.dart';
import 'package:cttns/components/login_widget/rounded_text_field.dart';
import 'package:cttns/modules/sign_up/sign_up_state.dart';
import 'package:cttns/modules/sign_up/sign_up_store.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage(
      {super.key, required this.onPress, required this.goToAccountPage});
  final VoidCallback onPress;
  final VoidCallback goToAccountPage;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late var store;
  @override
  void initState() {
    super.initState();
    store = SignupStore(widget.goToAccountPage);
  }

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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Đăng ký',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            color: AppColors.foreground,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  // Text(
                  //   'Please fill in the form to continue',
                  //   style: TextStyle(
                  //       fontSize: 14, color: AppColors.foregroundDark),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 42, bottom: 8),
                    child: RoundedTextField(
                      controller: state.fnController,
                      hintText: 'Tên đăng nhập',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: RoundedTextField(
                      controller: state.lnController,
                      hintText: 'Tên khách hàng',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: RoundedTextField(
                      controller: state.emailController,
                      hintText: 'Địa chỉ email',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.confirmPwdController,
                      password: true,
                      hintText: 'Mật khẩu xác nhận',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child:
                        RoundedButton(onPress: store.signUp, label: 'Đăng Ký'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                  //   child: RoundedButton(
                  //       onPress: () {}, label: 'Sign In with Google'),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Bạn đã có tài khoản?'),
                      TextButton(
                        onPressed: widget.onPress,
                        child: Text(
                          'Đăng nhập',
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
