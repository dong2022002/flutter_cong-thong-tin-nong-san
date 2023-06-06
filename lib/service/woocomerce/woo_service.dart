import 'package:cttns/models/product.dart';
import 'package:cttns/models/sign_up.dart';
import 'package:cttns/models/user.dart';
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
    return result.map((e) => ProductCategory.fromJson(e)).toList();
  }

  Future<Customer?> createCustomer(
      SignUp signUp, Function(Map<String, dynamic>) onError) async {
    var results = await MethodApi.postApi(
        "${Woo.baseUrl}/wp-json/wc/v3/customers", signUp.toJson(), onError);
    if (results == null) {
      return null;
    } else {
      return Customer.fromJson(results);
    }
  }
}
