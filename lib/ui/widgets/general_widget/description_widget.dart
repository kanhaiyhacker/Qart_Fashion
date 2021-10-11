import 'package:flutter/material.dart';
import 'package:qart_fashion/ui/widgets/general_widget/sub_title_text.dart';
import 'package:qart_fashion/ui/widgets/general_widget/title_text.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class DescriptionWidget extends StatelessWidget {
  final String label;
  final String value;

  DescriptionWidget({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(padding_all),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              label,
              color: accentColor,
            ),
            const SizedBox(height: vertical_desc_margin_height,),
            SubTitleText(
              value,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
