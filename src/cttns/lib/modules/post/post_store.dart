import 'package:cttns/modules/post/post_state.dart';
import 'package:cttns/service/woocomerce/rss_feed.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:webfeed/domain/rss_feed.dart';

class PostStore extends MobXStore<PostState> {
  PostStore() : super(PostInitState());
  final RssFeedData _rssFeedData = RssFeedData();
  Future getFeed() async {
    setLoading(true);
    RssFeed? rssNS = await _rssFeedData
        .getFeed('https://nongnghiep.vn/san-vat-dia-phuong.rss');
    RssFeed? rssNN = await _rssFeedData
        .getFeed('https://nongnghiep.vn/nong-san-viet-nong-nghiep-40.rss');
    RssFeed? rssTT =
        await _rssFeedData.getFeed('https://nongnghiep.vn/thi-truong.rss');
    update(PostDataState(rssSanVat: rssNS!, rssNN: rssNN!, rssTT: rssTT!));
    setLoading(false);
  }
}
