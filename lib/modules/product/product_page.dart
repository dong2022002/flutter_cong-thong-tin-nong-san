import 'package:cttns/components/home_widget/item_widget.dart';
import 'package:cttns/components/products_widget/productList_app_bar.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ProducListAppBar(
              onPress: () {},
            ),
            Container(
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: AppColors.background,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.tune,
                                  color: AppColors.foreground,
                                ),
                                label: Text(
                                  "Filter",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.foreground,
                                  ),
                                )),
                          ),
                          const VerticalDivider(
                            width: 2,
                            thickness: 1,
                          ),
                          buttonFilter("Nổi bật", () {}),
                          buttonFilter("Giá tốt", () {}),
                          buttonFilter("đặc sản", () {}),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: ItemsWidget(),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Padding buttonFilter(String text, VoidCallback onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OutlinedButton(
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.foreground,
            ),
          )),
    );
  }
}
