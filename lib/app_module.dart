import 'package:cttns/modules/cart/cart_page.dart';
import 'package:cttns/modules/global_store.dart';
import 'package:cttns/modules/product/detail_products.dart';
import 'package:cttns/modules/root/root_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance<http.Client>(http.Client()),
    Bind.singleton((i) => GlobalStore()),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const RootPage()),
    ChildRoute('/cart', child: (_, args) => const CartPage()),
    ChildRoute('/detailProduct', child: (_, args) => const DetailProductPage()),
    // ChildRoute(Modular.initialRoute, child: (_, __) => const SignInPage()),
    // ChildRoute('/root', child: (_, args) => const RootPage()),
    // ChildRoute('/signup', child: (_, args) => const SignUpPage()),
    // ChildRoute('/detail',
    //     child: (_, args) => ProductDetailPage(
    //           product: args.data as Product,
    //         )),
  ];
}
