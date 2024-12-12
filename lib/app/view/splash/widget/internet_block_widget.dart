import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

import '../splash_constants.dart';

class InternetBlockSplashWidget {
  InternetBlockSplashWidget(BuildContext context,
      {required void Function() retryFunc}) {
    final colors = UiColors.of(context);
    final alert = AlertDialog.adaptive(
      title: Text(SplashTextConstants.internetBlock.title),
      content: Text(SplashTextConstants.internetBlock.subTitle),
      actions: [
        TextButton(
            onPressed: () {
              retryFunc();
              Navigator.of(context).pop();
            },
            child: Text(
              SplashTextConstants.internetBlock.buttonLabel,
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: colors.primary),
            ))
      ],
    );
    showAdaptiveDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}
