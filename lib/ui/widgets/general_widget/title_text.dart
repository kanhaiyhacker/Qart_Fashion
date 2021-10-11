import 'package:flutter/material.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;

  const TitleText(this.text, {Key? key, this.color, this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(color: color ?? colorTitle, fontSize: title_size),
    );
  }
}
