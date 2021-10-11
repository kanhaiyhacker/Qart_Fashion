import 'package:flutter/material.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class OutLineDetailContainer extends StatelessWidget {
  final String label;
  final String value;

  OutLineDetailContainer({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding_all),
      child: TextFormField(
          enabled: false,
          initialValue: value,
          decoration: new InputDecoration(
            labelText: label,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: accentColor, width: outline_border_width),
            ),
          )),
    );
  }
}
