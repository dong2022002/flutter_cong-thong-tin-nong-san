import 'package:cttns/models/product.dart';
import 'package:cttns/service/woocomerce/method.dart';
import 'package:cttns/woo.dart';

class WooService {
  Future<List<Product>> getProducts() async {
    List<dynamic> result =
        await MethodApi.getApi("${Woo.baseUrl}/wp-json/wc/v3/products");
    return result.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<ProductCategory>> getCategories() async {
    List<dynamic> result = await MethodApi.getApi(
        "${Woo.baseUrl}/wp-json/wc/v3/products/categories");
    print(result);
    return result.map((e) => ProductCategory.fromJson(e)).toList();
  }
}
