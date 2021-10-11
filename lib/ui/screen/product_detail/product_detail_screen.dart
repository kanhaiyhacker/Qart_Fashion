import 'package:flutter/material.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/ui/screen/product_detail/product_details.dart';
import 'package:qart_fashion/ui/widgets/button/cart_button.dart';
import 'package:qart_fashion/ui/widgets/general_widget/body_text.dart';
import 'package:qart_fashion/ui/widgets/general_widget/description_widget.dart';
import 'package:qart_fashion/ui/widgets/item_widget/grid/grid_item.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';
import 'package:qart_fashion/utilities/app_string.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products product;

  ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: productDetailBackgroundColor,
        appBar: AppBar(
          title: Text(product.qRCode ?? ""),
          actions: [CartButton()],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(padding_all),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyText("6 Options (Tap to book)"),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: label_overall_quantity,
                                style: TextStyle(
                                    color: colorProductCount,
                                    fontSize: label_over_all_quantity_size)),
                            TextSpan(
                                text: "${product.maxQuantity}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                    fontSize:
                                        label_over_all_quantity_count_size))
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 240, maxCrossAxisExtent: 240),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return GridItem(product);
              }, childCount: 6),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProductDetails(product),
                  DescriptionWidget(
                    value: (product.description == null ||
                            product.description == "")
                        ? label_dummy_description
                        : product.description!,
                    label: label_description,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
