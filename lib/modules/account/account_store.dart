import 'package:cttns/modules/account/account_state.dart';
import 'package:cttns/modules/global_store.dart';
import 'package:cttns/service/woocomerce/woo_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';

class AccountStore extends MobXStore<AccountState> {
  AccountStore() : super(AcocuntInitState());
  final WooService _wooService = WooService();
  GlobalStore globalStore = Modular.get<GlobalStore>();
  Future gets() async {
    update(AccountDataState(
        currentCustomer: globalStore.currentCustomer,
        currentUser: globalStore.currentUser));

    return {};
  }
}
