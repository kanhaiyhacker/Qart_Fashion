import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/routes/route_constant.dart';
import 'package:qart_fashion/ui/screen/home/home_screen.dart';
import 'package:qart_fashion/ui/screen/product_detail/product_detail_screen.dart';
import 'package:qart_fashion/ui/screen/search_screen/bloc/search_screen_cubit.dart';
import 'package:qart_fashion/ui/screen/search_screen/bloc/search_screen_state.dart';
import 'package:qart_fashion/ui/screen/search_screen/product_search_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;

  switch (settings.name) {
    case home_route:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case search_route:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<SearchScreenCubit>.value(
            value: SearchScreenCubit(InitialState()),
            child: ProductSearchScreen()),
      );
    case product_detail_route:
      return MaterialPageRoute(
        builder: (context) =>
            ProductDetailScreen(settings.arguments as Products),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
  }

//AdventureLibrary.routeName: (ctx) => AdventureLibrary(),
}
