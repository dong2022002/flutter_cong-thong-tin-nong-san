import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';

class DetailProductBottomNavbar extends StatelessWidget {
  const DetailProductBottomNavbar({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.shopping_bag_outlined),
            //   label: const Text(
            //     "Thêm vào giỏ hàng",
            //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            //   ),
            //   style: ButtonStyle(
            //       backgroundColor:
            //           MaterialStateProperty.all(AppColors.foreground),
            //       padding: MaterialStateProperty.all(
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            //       )),
            // ),
            ElevatedButton(
                onPressed: () {
                  // GlobalStore globalStore = Modular.get<GlobalStore>();
                  // globalStore.addCart(_product.id, _product);
                  // const AdvanceSnackBar(
                  //         message: "Product added successfully",
                  //         bgColor: Colors.blueAccent,
                  //         duration:  Duration(microseconds: 500))
                  //     .show(context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.foreground, width: 2),
                      borderRadius: BorderRadius.circular(90.0),
                    ))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Thêm vào giỏ',
                    style: TextStyle(
                      color: AppColors.foreground,
                      fontSize: 18,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
