import 'package:cttns/models/product.dart';

abstract class HomeState {
  List<Product> products;
  List<ProductCategory> categories;
  HomeState({
    required this.products,
    required this.categories,
  });
}

class HomeInitState extends HomeState {
  HomeInitState() : super(categories: [], products: []);
}

class HomeDataState extends HomeState {
  HomeDataState({
    required List<Product> productList,
    required List<ProductCategory> categoryList,
  }) : super(categories: categoryList, products: productList);
}
