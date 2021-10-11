import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qart_fashion/injection/dependency_injection.dart';
import 'package:qart_fashion/routes/route_constant.dart';
import 'package:qart_fashion/ui/screen/home/bloc/home_screen_cubit.dart';
import 'package:qart_fashion/ui/screen/home/bloc/home_screen_state.dart';
import 'package:qart_fashion/ui/widgets/error_widget/common_error_widget.dart';
import 'package:qart_fashion/ui/widgets/error_widget/no_internet_widget.dart';
import 'package:qart_fashion/ui/widgets/button/outline_border_button.dart';
import 'package:qart_fashion/ui/widgets/loader/center_circular_loader.dart';
import 'package:qart_fashion/utilities/app_colors.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';
import 'package:qart_fashion/utilities/app_preference_manager.dart';
import 'package:qart_fashion/utilities/app_string.dart';
import 'package:qart_fashion/utilities/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeScreenCubit>(context).getProductCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(app_name),
        actions: [
          IconButton(
              onPressed: () {
                optionSearchScreen();
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          print(state);
          if (state is LoadingState) {
            return CenterCircularLoader();
          } else if (state is ErrorState) {
            if (state.errorType == ERROR.NO_INTERNET) {
              return NoInternetWidget(() {
                BlocProvider.of<HomeScreenCubit>(context).reloadProducts();
              });
            } else
              return CommonErrorWidget(
                message: state.message,
                action: () {
                  BlocProvider.of<HomeScreenCubit>(context).reloadProducts();
                },
              );
          } else if (state is DataLoadedState) {
            return _success(state.totalProduct);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _success(int totalProduct) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(padding_all),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: label_total_count,
                    style: TextStyle(
                        color: colorProductCount,
                        fontSize: product_count_label_size)),
                TextSpan(
                    text: " ($totalProduct)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: product_count_size))
              ]),
            ),
            const SizedBox(
              height: vertical_margin_height,
            ),
            OutlineBorderButton(
                buttonAction:
                    BlocProvider.of<HomeScreenCubit>(context).reloadProducts,
                buttonLabel: btn_label_reload_products)
          ],
        ),
      ),
    );
  }

  void optionSearchScreen() async {
    final dataLoad = await getIt.get<AppPreferenceManger>().getUserLoadedData();
    if (dataLoad) {
      Navigator.of(context).pushNamed(search_route);
    } else {
      final snackBar = SnackBar(content: Text(alert_no_local_data));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
