import 'package:cttns/models/product.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key, required this.products});
  final List<Product>? products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // childAspectRatio: 0.68,
        // crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.68,
            crossAxisSpacing: 2,
            mainAxisSpacing: 16),
        itemCount: products!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.foreground,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Modular.to.pushNamed('/detailProduct');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/1.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    products![index].name,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.foreground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Container(
                //     alignment: Alignment.centerLeft,
                //     child: Html(
                //       data: products![index].description,
                //       style: {
                //         "p": Style(
                //             fontSize: const FontSize(16),
                //             color: AppColors.foregroundDark)
                //       },
                //     )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        products![0].price.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: AppColors.foreground,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
