import 'package:flutter/material.dart';
import 'package:qart_fashion/ui/widgets/general_widget/body_text.dart';
import 'package:qart_fashion/ui/widgets/button/outline_border_button.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';
import 'package:qart_fashion/utilities/app_string.dart';

class CommonErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? action;

  CommonErrorWidget({Key? key, this.action, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Center(
          child: Column(children: [
        Image.asset(
          "assets/images/api_error_1.png",
          width: size.width / 1.5,
          height: size.height / 2,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(height: vertical_margin_height),
        BodyText(
          message ?? "",
          align: TextAlign.center,
        ),
        const SizedBox(height: vertical_margin_height),
        OutlineBorderButton(
            buttonAction: action ?? null, buttonLabel: btn_label_try_again)
      ])),
    );
  }
}
