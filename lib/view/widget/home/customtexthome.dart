import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CustomTextHome extends StatelessWidget {
  final String text;
  const CustomTextHome({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
