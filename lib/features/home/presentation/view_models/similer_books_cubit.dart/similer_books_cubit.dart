import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similer_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilerBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilerBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(
          SimilerBooksFailure(errorMessage: failure.errorMessage),
        );
      },
      (books) => emit(
        SimilerBooksSuccess(books),
      ),
    );
  }
}
