import 'package:equatable/equatable.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/utilities/enums.dart';

abstract class HomeScreenState extends Equatable {}

class LoadingState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class DataLoadedState extends HomeScreenState {
  final int totalProduct;

  // final List<Products> products;

  DataLoadedState(this.totalProduct /*, this.products*/);

  @override
  List<Object?> get props => [
        totalProduct /*products*/
      ];
}

class ErrorState extends HomeScreenState {
  final ERROR errorType;
  final String message;

  ErrorState(this.errorType, this.message);

  @override
  List<Object?> get props => [errorType, message];
}
