import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class PriceText extends StatelessWidget {
  final double? price;
  final TextAlign? align;
  final Color? color;

  const PriceText(this.price, {Key? key, this.align, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      amount,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(
        color: color ?? priceColor,
        fontSize: price_size,
      ),
    );
  }

  String get amount {
    return '₹' + price.toString();
  }
}
