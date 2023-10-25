import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CustomTextSign extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onPressed;

  const CustomTextSign({Key? key, required this.text1, required this.text2, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onPressed,
          child: Text(
            text2,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
