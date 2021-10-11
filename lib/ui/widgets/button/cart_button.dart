import 'package:flutter/material.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';
import 'package:qart_fashion/utilities/app_string.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.only(right: cart_button_right_margin),
      decoration: BoxDecoration(
          color: accentColor, borderRadius: BorderRadius.circular(cart_button_border_radius)),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(cart_button_border_radius),
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(padding_all),
                  decoration: BoxDecoration(),
                  child: Text(
                    btn_label_add_to_cart,
                    style: TextStyle(color: Colors.white),
                  )))),
    ));
  }
}
