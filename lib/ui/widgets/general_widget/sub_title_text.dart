import 'package:flutter/material.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;

  const SubTitleText(this.text, {this.color, Key? key, this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(color: color ?? colorSubTitle, fontSize: sub_title_size),
    );
  }
}
