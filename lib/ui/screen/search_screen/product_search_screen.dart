import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qart_fashion/ui/screen/search_screen/bloc/search_screen_cubit.dart';
import 'package:qart_fashion/ui/screen/search_screen/bloc/search_screen_state.dart';
import 'package:qart_fashion/ui/widgets/general_widget/body_text.dart';
import 'package:qart_fashion/ui/widgets/item_widget/search_screen_item/search_item.dart';
import 'package:qart_fashion/ui/widgets/loader/center_circular_loader.dart';
import 'package:qart_fashion/utilities/app_dimens.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenCubit, SearchScreenState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: searchBar(state),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (state is LoadingState)
              return CenterCircularLoader();
            else if (state is InitialState) {
              return centerText("start searching products");
            } else if (state is DataLoadedState) {
              if (state.products.length == 0)
                return centerText("No Products Found");
              else
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) =>
                        SearchItem(state.products[index]));
            } else
              return centerText("Not Reachable Widget");
          },
        ),
      );
    });
  }

  Widget centerText(String text) {
    return Padding(
      padding: const EdgeInsets.all(padding_all),
      child: Center(child: BodyText(text, align: TextAlign.center)),
    );
  }

  AppBar searchBar(SearchScreenState state) {
    return AppBar(
      title: TextField(
          controller: searchController,
          enabled: !(state is LoadingState),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) =>
              BlocProvider.of<SearchScreenCubit>(context).getProduct(value)),
      actions: [IconButton(onPressed: () {
        searchController.text = "";
        BlocProvider.of<SearchScreenCubit>(context).closeSearch();
      }, icon: Icon(Icons.close))],
    );
  }
}
