import 'package:cttns/values/colors.dart';
import 'package:flutter/material.dart';

class FormalButton extends StatelessWidget {
  const FormalButton({super.key, required this.label, required this.onPress});
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: AppColors.foregroundDark.withOpacity(.1),
            // border: Border(bottom: BorderSide(color: AppColors.secondaryButton)),
            borderRadius: BorderRadius.circular(4)),
        width: double.infinity,
        child: TextButton(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            onPressed: () {
              onPress();
            }),
      ),
    );
  }
}
