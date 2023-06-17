import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:cttns/modules/account/account_page.dart';
import 'package:cttns/modules/global_store.dart';
import 'package:cttns/modules/home/home_page.dart';
import 'package:cttns/modules/post/post_page.dart';
import 'package:cttns/modules/product/product_page.dart';
import 'package:cttns/modules/sign_in/sign_in_page.dart';
import 'package:cttns/modules/sign_up/sign_up_page.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late VoidCallback goToSignUp;
  late VoidCallback goToSignIn;
  late VoidCallback goToAccountPage;
  List<Widget> pages = [];

  int currentIndex = 0;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Trang chủ", Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
    TabItem(Icons.event_note, "Tin tức", Colors.red,
        labelStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    TabItem(Icons.dashboard_rounded, "Sản phẩm", Colors.orange,
        labelStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.person_pin, "Tài khoản", Colors.cyan),
  ]);
  late CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    _navigationController = CircularBottomNavigationController(currentIndex);
    super.initState();
    goToSignUp = () {
      setState(() {
        currentIndex = 6;
      });
    };
    goToSignIn = () {
      setState(() {
        currentIndex = 3;
      });
    };
    goToAccountPage = () {
      setState(() {
        currentIndex = 5;
      });
    };

    pages = [
      const HomePage(),
      // const WhisList(),
      const PostPage(),
      const ProductPage(),
      SignInPage(
        onPress: goToSignUp,
        goToAccount: goToAccountPage,
      ),
      const PostPage(),
      const AccountPage(),
      SignUpPage(
        onPress: goToSignIn,
        goToAccountPage: goToSignIn,
      ),
    ];
    GlobalStore globalStore = Modular.get<GlobalStore>();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalStore _globalStore = Modular.get<GlobalStore>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        barBackgroundColor: const Color(0xffFFFFFF),
        controller: _navigationController,
        selectedPos: currentIndex,
        selectedCallback: (int? selectedPos) {
          setState(() {
            if (_globalStore.isLogin && selectedPos == 3) {
              currentIndex = 5;
            } else {
              currentIndex = selectedPos ?? 0;
            }
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
