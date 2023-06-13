// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalStore on _GlobalStore, Store {
  late final _$productsAtom =
      Atom(name: '_GlobalStore.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_GlobalStore.currentUser', context: context);

  @override
  WPUser? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(WPUser? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$currentCustomerAtom =
      Atom(name: '_GlobalStore.currentCustomer', context: context);

  @override
  Customer? get currentCustomer {
    _$currentCustomerAtom.reportRead();
    return super.currentCustomer;
  }

  @override
  set currentCustomer(Customer? value) {
    _$currentCustomerAtom.reportWrite(value, super.currentCustomer, () {
      super.currentCustomer = value;
    });
  }

  late final _$listWishListAtom =
      Atom(name: '_GlobalStore.listWishList', context: context);

  @override
  ObservableList<Wishlist>? get listWishList {
    _$listWishListAtom.reportRead();
    return super.listWishList;
  }

  @override
  set listWishList(ObservableList<Wishlist>? value) {
    _$listWishListAtom.reportWrite(value, super.listWishList, () {
      super.listWishList = value;
    });
  }

  late final _$isLoginAtom =
      Atom(name: '_GlobalStore.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  @override
  String toString() {
    return '''
products: ${products},
currentUser: ${currentUser},
currentCustomer: ${currentCustomer},
listWishList: ${listWishList},
isLogin: ${isLogin}
    ''';
  }
}
