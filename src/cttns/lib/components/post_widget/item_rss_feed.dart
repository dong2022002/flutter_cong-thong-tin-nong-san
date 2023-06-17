import 'package:flutter/material.dart';

class ItemRssFeed extends StatelessWidget {
  const ItemRssFeed(
      {super.key,
      required this.urlImage,
      required this.title,
      required this.time,
      required this.onPress});
  final String urlImage;
  final String title;
  final String time;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    var dateformat = time.split(' ');
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPress,
      child: Column(
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
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.calendar_month,
                  size: 14,
                ),
              ),
              Text(
                dateformat[0],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ])
          ]),
    );
  }
}
