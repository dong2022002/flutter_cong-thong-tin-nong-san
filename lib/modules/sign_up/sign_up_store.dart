import 'package:cttns/models/sign_up.dart';
import 'package:cttns/models/user.dart';
import 'package:cttns/modules/sign_up/sign_up_state.dart';
import 'package:mobx_triple/mobx_triple.dart';

import '../../service/woocomerce/woo_service.dart';

class SignupStore extends MobXStore<SignupState> {
  SignupStore() : super(SignupInitState());

  final WooService _wooService = WooService();

  Future signUp() async {
    setLoading(true);
    SignUp signup = SignUp(
        email: state.emailController.text,
        firstName: state.fnController.text,
        lastName: state.lnController.text,
        password: state.pwdController.text);
    Map<String, dynamic>? response;
    Customer? user = await _wooService.createCustomer(signup, (error) {
      response = error;
    });
    if (user == null && response != null) {
      update(SignupFail(signup));
      setLoading(false);
      setError(Exception(response!["message"]));
      return {};
    }
    update(SignupSuccess(user!));
    setLoading(false);
    return {};
  }
}
