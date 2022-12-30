import 'package:flutter/material.dart';

import '../home/home.dart';

class ShowAlertDialog {
  Icon redExclamationPoint = const Icon(
    Icons.error,
    color: Colors.red,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );

  Icon greenCheckMark = const Icon(
    Icons.check_circle,
    color: Colors.green,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );

  void showAlertDialogSuccessAndCallHome(context, title, content, buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              greenCheckMark,
              Center(child: Text(title)),
            ],
          ),
          content: Text('   $content', textAlign: TextAlign.center),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  void showAlertDialogInformative(context, title, content, buttonText) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              redExclamationPoint,
              Center(child: Text(title)),
            ],
          ),
          content: Text('   $content', textAlign: TextAlign.center),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
