part of 'similer_books_cubit.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksFailure extends SimilerBooksState {
  final String errorMessage;

  const SimilerBooksFailure({required this.errorMessage});
}

final class SimilerBooksSuccess extends SimilerBooksState {
   final List<BookModel> book;

  const SimilerBooksSuccess(this.book);
}

final class SimilerBooksLoading extends SimilerBooksState {}
