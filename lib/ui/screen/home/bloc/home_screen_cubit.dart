import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qart_fashion/domain/remote/http_service.dart';
import 'package:qart_fashion/domain/repository/app_repository.dart';
import 'package:qart_fashion/injection/dependency_injection.dart';
import 'package:qart_fashion/utilities/app_preference_manager.dart';
import 'package:qart_fashion/utilities/enums.dart';

import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  var appRepository = getIt.get<AppRepository>();
  var pref = getIt.get<AppPreferenceManger>();

  HomeScreenCubit(HomeScreenState initialState) : super(LoadingState());

  Future<void> getProductCount() async {
    emit(LoadingState());
    bool hasData = await pref.getUserLoadedData();
    if (hasData) {
      int count = await pref.getProductCount();
      emit(DataLoadedState(count));
    } else {
      await reloadProducts();
    }
  }

  Future<void> reloadProducts() async {
    emit(LoadingState());
    try {
      int count = await appRepository.getDataFromRemote();
      emit(DataLoadedState(count));
    } on NoInternetException catch (e) {
      emit(ErrorState(ERROR.NO_INTERNET, e.toString()));
    } catch (e) {
      emit(ErrorState(ERROR.API_ERROR, e.toString()));
    }
  }
}
