import 'package:cttns/models/product.dart';
import 'package:cttns/modules/global_store.dart';
import 'package:cttns/modules/home/home_state.dart';
import 'package:cttns/service/woocomerce/woo_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class HomeStore extends MobXStore<HomeState> {
  HomeStore() : super(HomeInitState());
  final WooService _wooService = WooService();
  final GlobalStore _globalStore = Modular.get<GlobalStore>();

  Future gets() async {
    setLoading(true);
    List<Product> products = await _wooService.getProducts();
    // List<Categories> categories = await _wooService.getProductCategories();
    _globalStore.products = ObservableList.of(products);
    update(HomeDataState(productList: products, categoryList: []));
    setLoading(false);
    return {};
  }
}
