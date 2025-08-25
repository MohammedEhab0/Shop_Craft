import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_craft/UI/SignIn_page.dart';
import 'package:shop_craft/UI/home_page.dart';

import '../Utils/AppColors.dart';
import '../Utils/AppStyle.dart';
import '../Utils/CustomElevatedButton.dart';
import '../Utils/CustomTextField.dart';
import '../Utils/dialog.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
  static const routeName = 'SignupPage';
  var nameController = TextEditingController(text: "Mo Salah");
  var emailController = TextEditingController(text: "mo@gmail.com");
  var passwordController = TextEditingController(text: "12345678");
  var rePasswordController = TextEditingController(text: "12345678");
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
          'sign_up'.tr(),
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
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'enter_name'.tr(),
                    textInputType: TextInputType.name,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please enter name";
                      }

                      return null;
                    },
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
                  CustomTextField(
                    controller: rePasswordController,
                    obscureText: true,
                    prefixIcon: Icon(Icons.password),
                    hintText: 're_password'.tr(),
                    textInputType: TextInputType.phone,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please enter password";
                      }
                      if (text.length < 6) {
                        return "please enter more 6 character in  password";
                      }
                      if (text != passwordController.text) {
                        return "please  match password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        CustomDialogs.showSimpleDialog(context,title: "sign_up".tr(), content: 'Sign Up Successfully', okBtnFunction: (){
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(HomePage.routeName);
                        });
                      },
                      textButton: "create_account".tr()),
                  SizedBox(
                    height: height * .02,
                  ), Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have account'.tr(),
                        style: AppStyle.bold16Black,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(SignInPage.routeName);
                          },
                          child: Text(
                            'login'.tr(),
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
