import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../domain/authentication/i_authentication_repo.dart';
import 'books_state.dart';



class BooksCubit extends Cubit<BooksState> {
  final IAuthenticationRepo _authenticationRepository;

  BooksCubit(this._authenticationRepository) : super(BooksInitial());

  Future<void> login(String email, String password) async {
    emit(BooksLoading());
    try {
      final user = await _authenticationRepository.login(email, password);
      emit(BooksSuccess('Books successful'));
    } catch (e) {
      debugPrint(e.toString());
      emit(BooksError('Failed to Books'));
    }
  }
}