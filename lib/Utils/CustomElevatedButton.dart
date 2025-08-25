import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'AppStyle.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onPressed ;
  String textButton;
  CustomElevatedButton({required this.onPressed,required this.textButton});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.symmetric(
                vertical: height * .02, horizontal: width * .08),
            backgroundColor: AppColors.primarylight),
        onPressed: () {onPressed();},
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textButton,
              style: AppStyle.bold20White,
            ),

          ],
        ));
  }
}
