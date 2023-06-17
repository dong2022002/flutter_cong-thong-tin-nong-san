import 'package:flutter/material.dart';

class ItemRssFeed extends StatelessWidget {
  const ItemRssFeed(
      {super.key,
      required this.urlImage,
      required this.title,
      required this.time});
  final String urlImage;
  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                urlImage,
              ),
            ),
          ),
          Container(
            width: size.width * .55,
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          )
        ]);
  }
}
