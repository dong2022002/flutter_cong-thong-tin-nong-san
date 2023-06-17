import 'package:webfeed/webfeed.dart';

abstract class PostState {
  RssFeed feedSanVatDiaPhuong;
  RssFeed feedNongNghiep;
  RssFeed feedThiTruong;
  PostState(
      {required this.feedSanVatDiaPhuong,
      required this.feedNongNghiep,
      required this.feedThiTruong});
}

class PostInitState extends PostState {
  PostInitState()
      : super(
            feedSanVatDiaPhuong: RssFeed(),
            feedNongNghiep: RssFeed(),
            feedThiTruong: RssFeed());
}

class PostDataState extends PostState {
  PostDataState({
    required RssFeed rssSanVat,
    required RssFeed rssNN,
    required RssFeed rssTT,
  }) : super(
            feedSanVatDiaPhuong: rssSanVat,
            feedNongNghiep: rssNN,
            feedThiTruong: rssTT);
}
