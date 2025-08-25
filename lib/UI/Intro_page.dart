import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_craft/UI/SignIn_page.dart';
import 'package:shop_craft/Utils/AppStyle.dart';

import '../Utils/CustomElevatedButton.dart';
import 'SignUp_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  static const routeName = 'IntroPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding:  EdgeInsets.only(top:width * .07 ),
            child: Column(
              children: [
                Text("ShopCraft",style: AppStyle.bold20Black,),
                Text("Your Premium Shopping Experience",style: AppStyle.bold16gray,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * .04),
            child: Column(
              children: [
                Container(clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: height * .3,
                  child: Image.asset("assets/images/test.jpg"),
                ),
                Container(clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: height * .3,
                  child: Image.network(
                    "https://www.shutterstock.com/image-photo/closeup-on-hands-professional-business-260nw-2489777489.jpg",
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(SignInPage.routeName);
                },
                textButton: "sign_in".tr(),
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(SignUpPage.routeName);
                },
                textButton: "sign_up".tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
