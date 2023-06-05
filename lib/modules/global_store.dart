import 'package:cttns/models/product.dart';
import 'package:mobx/mobx.dart';

part 'global_store.g.dart';

// ignore: library_private_types_in_public_api
class GlobalStore = _GlobalStore with _$GlobalStore;

// ignore: unused_element
abstract class _GlobalStore with Store {
  @observable
  ObservableList<Product> products = ObservableList<Product>();
}
