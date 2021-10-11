import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qart_fashion/domain/repository/app_repository.dart';
import 'package:qart_fashion/injection/dependency_injection.dart';
import 'package:qart_fashion/ui/screen/search_screen/bloc/search_screen_state.dart';
import 'package:qart_fashion/utilities/app_preference_manager.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  var appRepository = getIt.get<AppRepository>();
  var pref = getIt.get<AppPreferenceManger>();

  SearchScreenCubit(SearchScreenState initialState) : super(initialState);

  Future<void> getProduct(String query) async {
    print("getProduct $query");
    emit(LoadingState());
    final products = await appRepository.getProducts(query);
    emit(DataLoadedState(products));
  }

  void closeSearch() {
    emit(InitialState());
  }
}
