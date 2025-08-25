import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../Utils/AppColors.dart';
import '../../Utils/AppStyle.dart';


class ToggleLanguage extends StatelessWidget {
  const ToggleLanguage({super.key});

  @override
  Widget build(BuildContext context) {

    bool isArabic = context.locale.languageCode == 'ar';

    return AnimatedToggleSwitch<bool>.dual(
      current: isArabic,
      first: false,
      second: true,
      onChanged: (val) {
        if (val) {
          context.setLocale(const Locale("ar"));
        } else {
          context.setLocale(const Locale("en"));
        }
      },
      style: ToggleStyle(
        backgroundColor: AppColors.primarylight.withOpacity(0.3),
        indicatorColor: AppColors.primarylight,
        borderRadius: BorderRadius.circular(20),
        borderColor: AppColors.primarylight,
      ),
      textBuilder: (val) => Text(
        val ? tr('arabic') : tr('english'),
        style: AppStyle.bold16White,
      ),
      iconBuilder: (val) =>  Icon(
        Icons.language,
        color: AppColors.white,
        size: 20,
      ),
      height: 40,
    );
  }
}