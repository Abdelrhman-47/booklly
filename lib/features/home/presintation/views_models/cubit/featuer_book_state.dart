

import 'package:booklly/core/erreors/failur.dart';
import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'featuer_book_state.freezed.dart';
@freezed
class FeatuerBookState with _$FeatuerBookState {
const factory FeatuerBookState.initial() = _Initial;
  const factory FeatuerBookState.loading() = _Loading;
  const factory FeatuerBookState.loaded(List<BookEntity> books) = _Loaded;
  const factory FeatuerBookState.error(Failure error) = _Error;
}
