import 'package:flutter/material.dart';
import 'package:qart_fashion/ui/widgets/general_widget/body_text.dart';
import 'package:qart_fashion/ui/widgets/button/outline_border_button.dart';
import 'package:qart_fashion/ui/widgets/general_widget/title_text.dart';
import 'package:qart_fashion/utilities/app_string.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback? action;

  NoInternetWidget(this.action, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(padding_all),
      child: Center(
          child: Column(children: [
        Image.asset(
          "assets/images/no_internet_1.gif",
          width: size.width / 1.5,
          height: size.height / 2,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(height: vertical_margin_height),
        TitleText(alert_no_internet_connection),
        const SizedBox(height: vertical_margin_height),
        BodyText(
          no_internet_message,
          align: TextAlign.center,
        ),
        const SizedBox(height: vertical_margin_height),
        OutlineBorderButton(
            buttonAction: action, buttonLabel: btn_label_try_again)
      ])),
    );
  }
}
