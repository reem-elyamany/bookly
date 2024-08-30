import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.homeRepo) : super(NewsBooksInitial());

    final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewsBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(NewsBooksFailure(failure.errmessage));
      },
      (books) {
        emit(NewsBooksSuccess(books));
      },
    );
  }
}
