import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Modular.to.pop();
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: AppColors.foregroundDark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Giỏ hàng",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foregroundDark),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.more_vert,
            size: 30,
            color: AppColors.foregroundDark,
          )
        ],
      ),
    );
  }
}
