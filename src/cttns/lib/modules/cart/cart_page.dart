import 'package:cttns/components/cart_widget/cart_app_bar.dart';
import 'package:cttns/components/cart_widget/cart_bottom_navbar.dart';
import 'package:cttns/components/cart_widget/cart_item.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CartAppBar(),
          Container(
            height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: Column(children: [
              const CartItem(),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.foreground,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Thêm mã giảm giá",
                        style: TextStyle(
                          color: AppColors.foreground,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomNavbar(),
    );
  }
}
