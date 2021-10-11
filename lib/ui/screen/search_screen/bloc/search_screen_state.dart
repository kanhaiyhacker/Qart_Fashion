import 'package:equatable/equatable.dart';
import 'package:qart_fashion/model/product/products_response.dart';
import 'package:qart_fashion/utilities/enums.dart';

abstract class SearchScreenState extends Equatable {}
class InitialState extends SearchScreenState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SearchScreenState {
  @override
  List<Object?> get props => [];
}

class DataLoadedState extends SearchScreenState {
  final List<Products> products;

  DataLoadedState(this.products);

  @override
  List<Object?> get props => [products];
}

class ErrorState extends SearchScreenState {
  final ERROR errorType;
  final String message;

  ErrorState(this.errorType, this.message);

  @override
  List<Object?> get props => [errorType, message];
}
