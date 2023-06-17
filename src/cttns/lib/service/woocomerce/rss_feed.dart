import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class RssFeedData {
  Future<RssFeed?> getFeed(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      return RssFeed.parse(response.body);
    } catch (e) {
      print("Error get rss Feed:$e");
    }
    return null;
  }
}
