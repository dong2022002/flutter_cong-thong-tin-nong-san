import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailProductAppBar extends StatelessWidget {
  const DetailProductAppBar({super.key});

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
              color: AppColors.foreground,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Chi tiết sản phẩm",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground),
            ),
          ),
          const Spacer(),
          // const Icon(
          //   Icons.favorite,
          //   size: 30,
          //   color: Colors.red,
          // )
        ],
      ),
    );
  }
}
