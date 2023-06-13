import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final ImageProvider<Object> image;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: image,
      ),
      onTap: onTap,
    );
  }
}
