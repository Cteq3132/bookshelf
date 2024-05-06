import 'package:bookshelf/modules/book_search/domain/errors.dart';
import 'package:bookshelf/shared/infra/books/models/book_lite.dart';
import 'package:bookshelf/shared/infra/books/port/books_repository.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get_it/get_it.dart';
import 'package:signals_flutter/signals_flutter.dart';

final searchText = signal<String?>(null);

final bookSearchSignals = computedAsync<IList<BookLite>>(
  () async {
    final text = searchText.value;
    if (text == null || text.isEmpty) throw SearchTextIsEmptyException();
    final res =
        await GetIt.instance.get<BooksRepository>().getBooksFiltered(text);
    if (res == null) {
      throw NoBookFoundException();
    }
    return res;
  },
);
