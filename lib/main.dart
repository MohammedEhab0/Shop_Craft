import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'UI/Intro_page.dart';
import 'UI/SignIn_page.dart';
import 'UI/SignUp_page.dart';
import 'UI/home_page.dart';

void main()async {
  runApp(
      EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child:MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Shop Craft',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: IntroPage.routeName,
      routes: {
        IntroPage.routeName: (context) =>  IntroPage(),
        HomePage.routeName: (context) =>  HomePage(),
        SignInPage.routeName: (context) => SignInPage(),
        SignUpPage.routeName: (context) => SignUpPage(),

      },

    );
  }
}

