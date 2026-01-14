import 'package:booklly/features/home/domain/use_case/featch_featured_use_case.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatuerBookCubit extends Cubit<FeatuerBookState> {
  FeatuerBookCubit(this.featuredBooksUseeCase)
    : super(const FeatuerBookState.initial());
  FetchFeaturedBooksUseeCase featuredBooksUseeCase;
  Future<void> featchFeatueredBooks({int pageNumbr = 0}) async {
    if (pageNumbr == 0) {
      emit(const FeatuerBookState.loading());
    }
    final result = await featuredBooksUseeCase.call(pageNumbr);
    result.fold(
      (failure) {
        if (pageNumbr == 0) {
          emit(FeatuerBookState.error(failure));
        } else {
          // For pagination error, we might want to show a snackbar or just keep the old state.
          // For now, keeping the old state is safer than replacing the whole view with an error.
          // Ideally, we would have a separate error state for pagination.
        }
      },
      (books) {
        if (pageNumbr == 0) {
          emit(FeatuerBookState.loaded(books));
        } else {
          state.maybeWhen(
            loaded: (oldBooks) {
              emit(FeatuerBookState.loaded([...oldBooks, ...books]));
            },
            orElse: () {
              emit(FeatuerBookState.loaded(books));
            },
          );
        }
      },
    );
  }
}
