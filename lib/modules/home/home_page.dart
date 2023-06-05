import 'package:cttns/components/home_widget/categories_widget.dart';
import 'package:cttns/components/home_widget/home_app_bar.dart';
import 'package:cttns/components/home_widget/item_widget.dart';
import 'package:cttns/modules/home/home_state.dart';
import 'package:cttns/modules/home/home_store.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _store = HomeStore();

  @override
  void initState() {
    super.initState();
    _store.gets();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<HomeStore, HomeState>(
      store: _store,
      onState: (context, state) {
        return Scaffold(
            body: ListView(
          children: [
            const HomeAppBar(),
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tìm kiếm ..."),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.camera_alt,
                        size: 27,
                        color: AppColors.foreground,
                      )
                    ]),
                  ),
                  tittleText("Danh mục"),
                  CategoriesWidget(
                    listCategories: state.categories,
                  ),
                  tittleText("Hàng nổi bật"),
                  ItemsWidget(
                    products: state.products,
                  )
                ],
              ),
            )
          ],
        ));
      },
      onError: (context, error) => Center(child: Text(error.toString())),
      onLoading: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  Container tittleText(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.foregroundDark),
      ),
    );
  }
}
