import 'package:cttns/modules/global_store.dart';
import 'package:cttns/modules/root/root_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.instance<http.Client>(http.Client()),
    Bind.singleton((i) => GlobalStore()),
  ];

  /// route || routes -> rút
  /// router  -> râu tơ
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const RootPage()),
    // ChildRoute(Modular.initialRoute, child: (_, __) => const SignInPage()),
    // ChildRoute('/root', child: (_, args) => const RootPage()),
    // ChildRoute('/signup', child: (_, args) => const SignUpPage()),
    // ChildRoute('/detail',
    //     child: (_, args) => ProductDetailPage(
    //           product: args.data as Product,
    //         )),
  ];
}
