import 'package:qart_fashion/domain/local/local_manager.dart';
import 'package:qart_fashion/domain/remote/remote_manager.dart';
import 'package:qart_fashion/injection/dependency_injection.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/utilities/app_preference_manager.dart';

class AppRepository {
  final localManager = getIt.get<LocalManager>();

  final remoteManager = getIt.get<RemoteManager>();
  final preferenceManager = getIt.get<AppPreferenceManger>();

  Future<int> getDataFromRemote() async {
    final products = await remoteManager.getProducts();
    await saveDataInLocalDatabase(products);
    return products.productCount ?? 0;
  }

  void getDataFromDatabase() {}

  Future<void> saveDataInLocalDatabase(
      ProductsResponse productsResponse) async {
    await localManager.insertData(productsResponse.products!);
    preferenceManager.setProductCount(productsResponse.productCount ?? 0);
    preferenceManager.setUserLoadedData(true);
  }

  Future<List<Products>> getProducts(String query) async {
    return await localManager.getListOfProducts(query) ?? [];
  }
}
