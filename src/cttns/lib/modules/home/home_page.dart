import 'package:carousel_slider/carousel_slider.dart';
import 'package:cttns/components/home_widget/home_app_bar.dart';
import 'package:cttns/components/home_widget/item_widget.dart';
import 'package:cttns/modules/home/home_state.dart';
import 'package:cttns/modules/home/home_store.dart';
import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _store = HomeStore();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    super.initState();
    _store.gets();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<HomeStore, HomeState>(
      store: _store,
      onState: (context, state) {
        return Scaffold(
            body: ListView(
          children: [
            const HomeAppBar(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 15),
                  //   padding: const EdgeInsets.symmetric(horizontal: 15),
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: Row(children: [
                  //     Container(
                  //       margin: const EdgeInsets.only(left: 5),
                  //       height: 50,
                  //       width: 300,
                  //       child: TextFormField(
                  //         decoration: const InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText: "Tìm kiếm ..."),
                  //       ),
                  //     ),
                  //     const Spacer(),
                  //     Icon(
                  //       Icons.camera_alt,
                  //       size: 27,
                  //       color: AppColors.foreground,
                  //     )
                  //   ]),
                  // ),
                  // tittleText("Danh mục"),
                  // CategoriesWidget(
                  //   listCategories: state.categories,
                  // ),
                  SizedBox(
                    height: 180,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1.9,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        carouselController: _controller,
                        items: [0, 1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 125,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    // decoration: BoxDecoration(color: Colors.amber),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        extractImageUrl(
                                            state.rssNS.items![i].description!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 4),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 45,
                                    child: Center(
                                      child: Text(
                                        state.rssNS.items![i].title!,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black.withOpacity(.6),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [0, 1, 2, 3, 4, 5].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  tittleText("Nông sản nổi bật"),
                  ItemsWidget(
                    products: state.products,
                  )
                ],
              ),
            )
          ],
        ));
      },
      onError: (context, error) => Center(child: Text(error.toString())),
      onLoading: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  Container tittleText(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.foregroundDark),
      ),
    );
  }

  String extractImageUrl(String htmlString) {
    // Parse HTML
    dom.Document document = parser.parse(htmlString);
    // Find the first <img> tag
    dom.Element? imgElement = document.querySelector('img');
    // Extract the image URL
    String? imageUrl = imgElement!.attributes['src'];
    return imageUrl!;
  }
}
