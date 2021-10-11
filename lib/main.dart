import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:qart_fashion/app/app_theme.dart';
import 'package:qart_fashion/routes/main_router.dart';
import 'package:qart_fashion/ui/screen/home/bloc/home_screen_state.dart';
import 'package:qart_fashion/ui/screen/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:qart_fashion/ui/screen/home/bloc/home_screen_cubit.dart';
import 'package:sqflite/sqflite.dart';

import 'injection/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qart Fashion',
      theme: appTheme,
      home: BlocProvider<HomeScreenCubit>.value(
        value: HomeScreenCubit(LoadingState()),
        child: HomeScreen(),
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
