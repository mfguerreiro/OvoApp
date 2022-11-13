import 'package:flutter/material.dart';

class ShowAlertDialog {
  Icon redExclamationPoint = const Icon(
    Icons.error,
    color: Colors.red,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );

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
