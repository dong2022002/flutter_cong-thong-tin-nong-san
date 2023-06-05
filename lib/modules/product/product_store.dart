import 'package:cttns/models/product.dart';
import 'package:cttns/modules/global_store.dart';
import 'package:cttns/modules/product/product_state.dart';
import 'package:cttns/service/woocomerce/woo_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class ProductStore extends MobXStore<ProductState> {
  ProductStore() : super(ProductInitState());
  final WooService _wooService = WooService();
  final GlobalStore _globalStore = Modular.get<GlobalStore>();

  Future gets() async {
    setLoading(true);
    List<Product> products = await _wooService.getProducts();
    List<ProductCategory> categories = await _wooService.getCategories();
    _globalStore.products = ObservableList.of(products);
    update(ProductDataState(productList: products, categoryList: categories));
    setLoading(false);
    return {};
  }
}
