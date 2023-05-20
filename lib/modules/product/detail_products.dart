import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:cttns/components/products_widget/detail_product_app_bar.dart';
import 'package:cttns/components/products_widget/detail_product_bottom_navbar.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: ListView(
        children: [
          const DetailProductAppBar(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              "assets/images/1.png",
              height: 300,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            "Tên sản phẩm",
                            style: TextStyle(
                              fontSize: 28,
                              color: AppColors.foreground,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: AppColors.foreground,
                            ),
                            onRatingUpdate: (index) {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "mô tả",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 17, color: AppColors.foreground),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const DetailProductBottomNavbar(),
    );
  }
}
