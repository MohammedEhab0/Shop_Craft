import 'package:flutter/material.dart';

class CustomDialogs {

  static void showSimpleDialog(
      BuildContext context, {
        required String title,
        required String content,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel",
        required VoidCallback okBtnFunction,
      }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              child: Text(okBtnText),
              onPressed: () {

                Navigator.pop(context);
                okBtnFunction();
              },
            ),
            ElevatedButton(
              child: Text(cancelBtnText),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  static void showCustomDialog(
      BuildContext context, {
        required String title,
        required Widget contentWidget,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel",
        required VoidCallback okBtnFunction,
      }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: contentWidget,
          actions: <Widget>[
            ElevatedButton(
              child: Text(okBtnText),
              onPressed: () {
                okBtnFunction();
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text(cancelBtnText),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}