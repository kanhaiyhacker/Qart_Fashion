import 'package:flutter/material.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/routes/route_constant.dart';
import 'package:qart_fashion/ui/widgets/general_widget/price_text.dart';
import 'package:qart_fashion/ui/widgets/general_widget/sub_title_text.dart';
import 'package:qart_fashion/ui/widgets/general_widget/title_text.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class SearchItem extends StatelessWidget {
  final Products product;

  const SearchItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => getToDetailScreen(context),
          child: Padding(
            padding: const EdgeInsets.all(padding_all),
            child: Column(
              children: [_header(), _productDetails()],
            ),
          ),
        ),
      ),
    );
  }

  void getToDetailScreen(context) {
    Navigator.of(context).pushNamed(product_detail_route, arguments: product);
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.qRCode ?? "",
          style: TextStyle(),
        ),
        Icon(Icons.keyboard_arrow_up_outlined)
      ],
    );
  }

  Widget _productDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              _productImage(),
              const SizedBox(
                width: horizontal_margin_height,
              ),
              _colorPriceDetails(),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(child: _availableSizes()),
        )
      ],
    );
  }

  Widget _productImage() {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(4),
      child: product.imageUrl == null || product.imageUrl == ""
          ? Image.asset(
              'assets/images/placeholder.png',
              fit: BoxFit.scaleDown,
              width: item_image_width,
            )
          : Image.network(product.imageUrl!,
              width: item_image_width,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.scaleDown,
                    width: item_image_width,
                  ),
              fit: BoxFit.scaleDown),
    );
  }

  Widget _colorPriceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          product.name ?? "",

        ),
        SubTitleText(product.displayName ?? ""),
        SubTitleText(product.color ?? ""),
        PriceText(product.mRP)
      ],
    );
  }

  Widget _availableSizes() {
    String sizes = product.eAN?.keys.toList().join(", ") ?? "";
    return Text(
      sizes,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 17, color: colorSizes),
    );
  }
}
