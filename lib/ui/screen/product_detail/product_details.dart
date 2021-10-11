import 'package:flutter/material.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/ui/widgets/general_widget/outline_detail_container.dart';
import 'package:qart_fashion/utilities/app_string.dart';

class ProductDetails extends StatelessWidget {
  final Products product;

  ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          OutLineDetailContainer(
              value:
                  "${product.brand ?? ""} -- ${product.category ?? ""} -- ${product.collection ?? ""}",
              label: label_brand_category_collection),
          OutLineDetailContainer(
              value:
                  "${product.gender ?? ""} -- ${product.name ?? ""} -- ${product.subCategory ?? ""}",
              label: label_gender_name_sub_cat),
          OutLineDetailContainer(
              value:
                  "${product.fit ?? ""} -- ${product.theme ?? ""} -- ${product.finish ?? ""}",
              label: label_fit_theme_finish),
          OutLineDetailContainer(
              value:
                  "[${product.offerMonths?.join(" ,") ?? ""}]-- ${product.theme ?? ""} -- ${product.mood ?? ""}",
              label: label_offer_month_mood),
          OutLineDetailContainer(
              value: "₹${product.mRP ?? ""}", label: label_price)
        ],
      ),
    );
  }
}
