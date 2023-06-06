import 'package:cttns/models/login_user.dart';
import 'package:cttns/models/product.dart';
import 'package:cttns/models/user.dart';
import 'package:cttns/models/wishlist.dart';
import 'package:mobx/mobx.dart';

part 'global_store.g.dart';

// ignore: library_private_types_in_public_api
class GlobalStore = _GlobalStore with _$GlobalStore;

// ignore: unused_element
abstract class _GlobalStore with Store {
  @observable
  ObservableList<Product> products = ObservableList<Product>();
  @observable
  WPUser? currentUser;
  @observable
  Customer? currentCustomer;
  @observable
  ObservableList<Wishlist>? listWishList;
  @observable
  bool isLogin = false;
}
