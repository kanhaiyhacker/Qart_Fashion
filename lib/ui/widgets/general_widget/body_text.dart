import 'package:qart_fashion/utilities/app_dimens.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final TextAlign align;

  const BodyText(this.text, {Key? key, this.align = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: body_text_size,
        color: colorTextColor,
      ),
    );
  }
}
