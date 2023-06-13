import 'package:cttns/models/product.dart';

abstract class ProductState {
  List<Product> products;
  List<ProductCategory> categories;
  ProductState({
    required this.products,
    required this.categories,
  });
}

class ProductInitState extends ProductState {
  ProductInitState() : super(categories: [], products: []);
}

class ProductDataState extends ProductState {
  ProductDataState({
    required List<Product> productList,
    required List<ProductCategory> categoryList,
  }) : super(categories: categoryList, products: productList);
}
