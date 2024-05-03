import 'package:bookshelf/shared/infra/books/models/book_lite.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

abstract class BooksRepository extends Equatable {
  Future<IList<BookLite>?> getBooksFiltered(String filter);

  @override
  List<Object?> get props => [];
}
