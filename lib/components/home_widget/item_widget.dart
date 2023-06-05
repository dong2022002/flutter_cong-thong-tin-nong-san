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
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.68,
            crossAxisSpacing: 2,
            mainAxisSpacing: 16),
        itemCount: products!.length,
        itemBuilder: (BuildContext context, int index) {
          String priceProduct = products![index].price!.toInt().toString();
          priceProduct = priceProduct.replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
          priceProduct += ' đ';
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
                      child: Text(
                        "${(((products![index].price! - products![index].regularPrice!) / products![index].regularPrice!) * 100).toStringAsFixed(0)}%",
                        style: const TextStyle(
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
                    child: products![index].images.isNotEmpty
                        ? Image.network(
                            products![index].images[0].src,
                            height: 120,
                            width: 120,
                          )
                        : Image.asset(
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
                //     child: HtmlWidget(
                //       products![index].shortDescription,
                //       textStyle: const TextStyle(
                //         overflow: TextOverflow.ellipsis,
                //         fontSize: 12,
                //       ),
                //     )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        priceProduct,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
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
