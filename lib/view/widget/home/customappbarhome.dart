import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAppBarHome extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final IconData iconData;
   bool active ;
   CustomAppBarHome(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.iconData,
      required this.active,


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color:active== true?AppColors.iconColor1 : AppColors.primaryColor,
          ),
          Text(
            text,
            style: TextStyle(color: active== true?AppColors.iconColor1 : AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}
