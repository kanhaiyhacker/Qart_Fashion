import 'package:flutter/material.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_string.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          color: accentColor, borderRadius: BorderRadius.circular(20)),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(),
                  child: Text(
                    btn_label_add_to_cart,
                    style: TextStyle(color: Colors.white),
                  )))),
    ));
  }
}
