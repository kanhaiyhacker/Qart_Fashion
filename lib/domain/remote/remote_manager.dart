import 'package:qart_fashion/domain/remote/http_service.dart';
import 'package:qart_fashion/model/product/products_response.dart';

import 'http_constant.dart';

class RemoteManager {
  ApiManager apiManager = ApiManager();

  Future<ProductsResponse> getProducts() async {
    final data = await apiManager.getApiCall(PRODUCTS_URL);
    ProductsResponse response = ProductsResponse.fromJson(data);
    return response;
  }
}
