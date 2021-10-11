import 'package:flutter/material.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class OutlineBorderButton extends StatelessWidget {
  final String? buttonLabel;
  final VoidCallback? buttonAction;

  OutlineBorderButton(
      {@required this.buttonAction, @required this.buttonLabel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(buttonLabel ?? ""),
      onPressed: buttonAction,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(button_border))),
      ),
    );
  }
}
