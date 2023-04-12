import 'package:flutter/material.dart';

class WhisList extends StatefulWidget {
  const WhisList({super.key});

  @override
  State<WhisList> createState() => _WhisListState();
}

class _WhisListState extends State<WhisList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('WhisList')),
      ),
    );
  }
}
