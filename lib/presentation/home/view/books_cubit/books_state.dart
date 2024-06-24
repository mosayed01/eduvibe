import 'package:equatable/equatable.dart';

class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState {
  final String message;

  const BooksSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class BooksError extends BooksState {
  final String message;

  const BooksError(this.message);

  @override
  List<Object> get props => [message];
}

class ChangeOptionState extends BooksState {}

class ChangePassState extends BooksState {}