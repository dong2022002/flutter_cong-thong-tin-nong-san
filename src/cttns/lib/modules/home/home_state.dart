import 'package:cttns/models/product.dart';
import 'package:webfeed/webfeed.dart';

abstract class HomeState {
  RssFeed rssNS;
  List<Product> products;
  List<ProductCategory> categories;
  HomeState({
    required this.products,
    required this.categories,
    required this.rssNS,
  });
}

class HomeInitState extends HomeState {
  HomeInitState() : super(categories: [], products: [], rssNS: RssFeed());
}

class HomeDataState extends HomeState {
  HomeDataState({
    required List<Product> productList,
    required List<ProductCategory> categoryList,
    required RssFeed rssNS,
  }) : super(categories: categoryList, products: productList, rssNS: rssNS);
}
