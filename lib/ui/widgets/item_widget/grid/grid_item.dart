import 'package:flutter/material.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/routes/route_constant.dart';
import 'package:qart_fashion/ui/widgets/general_widget/price_text.dart';
import 'package:qart_fashion/ui/widgets/general_widget/sub_title_text.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class GridItem extends StatelessWidget {
  final Products product;

  const GridItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        children: [
          LayoutBuilder(
              builder: (context, constraints) => _productDetails(constraints)),
          _ratings()
        ],
      ),
    );
  }

  void getToDetailScreen(context) {
    Navigator.of(context).pushNamed(product_detail_route, arguments: product);
  }

  Widget _productDetails(BoxConstraints constraints) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _productImage(),
        Positioned(bottom: 0, child: _colorPriceDetails(constraints)),
      ],
    );
  }

  Widget _productImage() {
    return Container(
      color: Colors.grey,
      // padding: EdgeInsets.all(4),
      child: product.imageUrl == null || product.imageUrl == ""
          ? Image.asset(
              'assets/images/placeholder.png',
              fit: BoxFit.scaleDown,
              height: grid_image_height,
            )
          : Image.network(product.imageUrl!,
              height: grid_image_height,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.scaleDown,
                    height: grid_image_height,
                  ),
              fit: BoxFit.scaleDown),
    );
  }

  Widget _colorPriceDetails(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      color: Colors.black54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SubTitleText(
            product.displayName ?? "",
            color: Colors.white,
            align: TextAlign.center,
          ),
          SubTitleText(
            product.color ?? "",
            color: Colors.white,
            align: TextAlign.center,
          ),
          PriceText(
            product.mRP,
            color: Colors.white,
            align: TextAlign.center,
          )
        ],
      ),
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

  Widget _ratings() {
    List<Widget> icons = [
      Icon(
        Icons.star_sharp,
        color: accentColor,
      ),
      Icon(
        Icons.star_sharp,
        color: accentColor,
      ),
      Icon(
        Icons.star_sharp,
        color: accentColor,
      ),
      Icon(
        Icons.star_half,
        color: accentColor,
      ),
    ];
    // int likes =
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...icons, Text("(${product.likeabilty ?? 0.0})")],
    );
  }
}
