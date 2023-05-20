import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:cttns/modules/account/account_page.dart';
import 'package:cttns/modules/home/home_page.dart';
import 'package:cttns/modules/post/post_page.dart';
import 'package:cttns/modules/product/product_page.dart';
import 'package:cttns/modules/whislist/WhisListPage.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> pages = [
    const HomePage(),
    const WhisList(),
    const ProductPage(),
    const AccountPage(),
    const PostPage(),
  ];
  int currentIndex = 0;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Trang chủ", Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.favorite, "Yêu thích", Colors.red,
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
    // GlobalStore globalStore = Modular.get<GlobalStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: pages[_navigationController.value ?? 0],
      ),
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        barBackgroundColor: const Color(0xffFFFFFF),
        controller: _navigationController,
        selectedPos: currentIndex,
        selectedCallback: (int? selectedPos) {
          setState(() {
            currentIndex = selectedPos ?? 0;
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
