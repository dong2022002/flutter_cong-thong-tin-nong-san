import 'package:cttns/models/login_user.dart';
import 'package:cttns/models/user.dart';

abstract class AccountState {
  WPUser? currentUser;
  Customer? currentCustomer;
  AccountState({this.currentUser, this.currentCustomer});
}

class AcocuntInitState extends AccountState {}

class AccountDataState extends AccountState {
  AccountDataState({WPUser? currentUser, Customer? currentCustomer})
      : super(currentCustomer: currentCustomer, currentUser: currentUser);
}
