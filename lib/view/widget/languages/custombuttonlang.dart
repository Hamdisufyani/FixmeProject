import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton ;
  final void Function()? onPresses;
  const CustomButtonLang({Key? key, required this.textButton, this.onPresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.white,
        color: AppColors.primaryColor, onPressed: onPresses,
        child:  Text(textButton, style: const TextStyle(fontWeight: FontWeight.bold),),

      ),
    );
  }
}
