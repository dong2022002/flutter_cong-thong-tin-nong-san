import 'package:cttns/components/products_widget/detail_product_app_bar.dart';
import 'package:cttns/components/products_widget/detail_product_bottom_navbar.dart';
import 'package:cttns/models/cart.dart';
import 'package:cttns/models/product.dart';
import 'package:cttns/values/colors.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key, required this.product});
  final Product product;

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late Product _product;
  late String priceProduct = "";
  @override
  void initState() {
    _product = widget.product;
    priceProduct = _product.price!.toInt().toString();
    priceProduct = priceProduct.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    priceProduct += ' đ';
    super.initState();
  }

  int sumQuantity(List<Cart> lists) {
    int sum = 0;
    for (var element in lists) {
      sum += element.quantity;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: ListView(
        children: [
          const DetailProductAppBar(),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              width: double.infinity,
                              height: width * 2 / 3,
                              child: _product.images.isEmpty
                                  ? Image.asset(
                                      "assets/images/1.png",
                                      height: 300,
                                    )
                                  : Image.network(
                                      _product.images[0].src,
                                      height: 300,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      _product.name.toUpperCase(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, bottom: 12, right: 12),
                              child: Text(
                                priceProduct,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.foreground),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, bottom: 12, right: 12),
                              child: ExpandablePanel(
                                  header: const Text(
                                    'Mô tả',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  collapsed: const Divider(
                                    height: 2,
                                  ),
                                  expanded: HtmlWidget(
                                    _product.description,
                                    textStyle: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14.5,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, bottom: 12, right: 12),
                              child: ExpandablePanel(
                                  header: const Text(
                                    'Kích thước',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  collapsed: const Divider(
                                    height: 2,
                                  ),
                                  expanded: const HtmlWidget(
                                    '',
                                  )
                                  // tapHeaderToExpand: true,
                                  // hasIcon: true,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, bottom: 12, right: 12),
                              child: ExpandablePanel(
                                  header: const Text(
                                    'Phương thức vận chuyển',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  collapsed: const Divider(
                                    height: 2,
                                  ),
                                  expanded: const HtmlWidget(
                                    '',
                                  )
                                  // tapHeaderToExpand: true,
                                  // hasIcon: true,
                                  ),
                            ),
                            const SizedBox(
                              height: 72,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: DetailProductBottomNavbar(price: priceProduct),
    );
  }
}
