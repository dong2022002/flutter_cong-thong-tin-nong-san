import 'package:badges/badges.dart' as badges;
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(children: [
        Icon(
          Icons.sort,
          size: 30,
          color: AppColors.foregroundDark,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            "Nông sản Lâm Đồng",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: AppColors.foregroundDark,
            ),
          ),
        ),
        const Spacer(),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
          ),
          badgeContent: const Text(
            "3",
            style: TextStyle(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              Modular.to.pushNamed('/cart');
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
              color: AppColors.foregroundDark,
            ),
          ),
        )
      ]),
    );
  }
}
