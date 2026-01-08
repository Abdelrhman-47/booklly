import 'package:booklly/features/home/domain/use_case/featch_featured_use_case.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatuerBookCubit extends Cubit<FeatuerBookState> {
  FeatuerBookCubit(this.featuredBooksUseeCase)
    : super(const FeatuerBookState.initial());
  FetchFeaturedBooksUseeCase featuredBooksUseeCase;
  void featchFeatueredBooks() async {
    final result = await featuredBooksUseeCase.call();
    result.fold(
      (failure) => emit(FeatuerBookState.error(failure)),
      (books) => emit(FeatuerBookState.loaded(books)),
    );
  }
}
