import 'package:cttns/components/whislist_widget/whislist_app_bar.dart';
import 'package:cttns/components/whislist_widget/whislist_item.dart';
import 'package:cttns/values/colors.dart';
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
      body: ListView(
        children: [
          const WhisListAppBar(),
          Container(
            height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: AppColors.background,
            ),
            child: Column(
              children: [const WhislistItem()],
            ),
          ),
        ],
      ),
    );
  }
}
