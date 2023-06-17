import 'package:cttns/components/post_widget/item_rss_feed.dart';
import 'package:cttns/components/post_widget/post_app_bar.dart';
import 'package:cttns/modules/post/post_state.dart';
import 'package:cttns/modules/post/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostStore _store = PostStore();
  @override
  void initState() {
    super.initState();
    _store.getFeed();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _heightRss = size.height * .28;
    return ScopedBuilder<PostStore, PostState>(
      store: _store,
      onState: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PostAppBar(onPress: () {}),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Sản vật địa phương",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Text("Xem thêm"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightRss,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                void loadUrlSource() {
                                  _launchURL(state
                                      .feedSanVatDiaPhuong.items![index].link!);
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: ItemRssFeed(
                                    urlImage: extractImageUrl(state
                                        .feedSanVatDiaPhuong
                                        .items![index]
                                        .description!),
                                    title: state.feedSanVatDiaPhuong
                                        .items![index].title!,
                                    time: state.feedSanVatDiaPhuong
                                        .items![index].pubDate
                                        .toString(),
                                    onPress: loadUrlSource,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Thị trường",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Text("Xem thêm"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightRss,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                void loadUrlSource() {
                                  _launchURL(
                                      state.feedThiTruong.items![index].link!);
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: ItemRssFeed(
                                    urlImage: extractImageUrl(state
                                        .feedThiTruong
                                        .items![index]
                                        .description!),
                                    title: state
                                        .feedThiTruong.items![index].title!,
                                    time: state
                                        .feedThiTruong.items![index].pubDate
                                        .toString(),
                                    onPress: loadUrlSource,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Nông nghiệp 4.0",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Text("Xem thêm"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightRss,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                void loadUrlSource() {
                                  _launchURL(
                                      state.feedNongNghiep.items![index].link!);
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: ItemRssFeed(
                                    urlImage: extractImageUrl(state
                                        .feedNongNghiep
                                        .items![index]
                                        .description!),
                                    title: state
                                        .feedNongNghiep.items![index].title!,
                                    time: state
                                        .feedNongNghiep.items![index].pubDate
                                        .toString(),
                                    onPress: loadUrlSource,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onError: (context, error) => Center(child: Text(error.toString())),
      onLoading: (context) => const Center(child: CircularProgressIndicator()),
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

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
