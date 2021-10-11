import 'package:qart_fashion/model/product/products_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferenceManger {
  static AppPreferenceManger? _instance;
  static SharedPreferences? _preferences;

  static const LOADED_DATA = "loaded_data";
  static const PRODUCTS_COUNT = "product_count";

  static Future<AppPreferenceManger> getInstance() async {
    if (_instance == null) {
      _instance = AppPreferenceManger();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  void setUserLoadedData(bool value) {
    _preferences?.setBool(LOADED_DATA, value);
  }

  Future<bool> getUserLoadedData() async {
    final hasKey = _preferences?.containsKey(LOADED_DATA);
    if (hasKey != null && hasKey) {
      final data = _preferences?.getBool(LOADED_DATA);
      if (data != null)
        return data;
      else
        return false;
    } else {
      return false;
    }
  }

  void setProductCount(int value) {
    _preferences?.setInt(PRODUCTS_COUNT, value);
  }

  Future<int> getProductCount() async {
    final hasKey = _preferences?.containsKey(PRODUCTS_COUNT);
    if (hasKey != null && hasKey) {
      final data = _preferences?.getInt(PRODUCTS_COUNT);
      if (data != null)
        return data;
      else
        return 0;
    } else {
      return 0;
    }
  }


}
