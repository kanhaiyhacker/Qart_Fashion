import 'package:get_it/get_it.dart';
import 'package:qart_fashion/domain/local/local_manager.dart';
import 'package:qart_fashion/domain/remote/remote_manager.dart';
import 'package:qart_fashion/domain/repository/app_repository.dart';
import 'package:qart_fashion/utilities/app_preference_manager.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectDependency() async {
  final AppPreferenceManger _preferenceManager =
      await AppPreferenceManger.getInstance();
  final LocalManager _localManager = await LocalManager.getInstance();
  getIt.registerSingleton<AppPreferenceManger>(_preferenceManager);
  getIt.registerSingleton<LocalManager>(_localManager);
  getIt.registerSingleton<RemoteManager>(RemoteManager());
  getIt.registerSingleton<AppRepository>(AppRepository());

}
