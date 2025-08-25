import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_craft/UI/SignUp_page.dart';

import '../Utils/AppColors.dart';
import '../Utils/AppStyle.dart';
import '../Utils/CustomElevatedButton.dart';
import '../Utils/CustomTextField.dart';
import '../Utils/dialog.dart';
import 'home_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static const routeName = 'SignIn';
  var emailController = TextEditingController(text: "mo@gmail.com");
  var passwordController = TextEditingController(text: "12345678");
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var  width=MediaQuery.of(context).size.width;
    var  height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "sign_in".tr(),
          style: AppStyle.bold20Black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height * .05,
                  ),
                  // Container(
                  //   height: height * .23,
                  //   child: Image.asset(AppAssets.logoSplash),
                  // ),
                  SizedBox(
                    height: height * .05,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    controller: emailController,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'enter_email'.tr(),
                    textInputType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please enter email";
                      }
                      final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return "please enter valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    obscureText: true,
                    prefixIcon: Icon(Icons.password),
                    hintText: 'enter_password'.tr(),
                    textInputType: TextInputType.phone,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please enter password";
                      }
                      if (text.length < 6) {
                        return "please enter more 6 character in  password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        CustomDialogs.showSimpleDialog(context,title: "sign_in".tr(), content: 'Login Successfully', okBtnFunction: (){
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(HomePage.routeName);
                        });

                      },
                      textButton: "sign_in".tr()),
                  SizedBox(
                    height: height * .02,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'do not have account'.tr(),
                        style: AppStyle.bold16Black,
                      ),
                      TextButton(
                          onPressed: () {

                            Navigator.of(context)
                                .pushReplacementNamed(SignUpPage.routeName);
                          },
                          child: Text(
                            'create account'.tr(),
                            style: AppStyle.bold16PrimaryLight.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primarylight),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
