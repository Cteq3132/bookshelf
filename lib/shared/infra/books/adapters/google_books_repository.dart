import 'package:bookshelf/shared/infra/books/models/book_lite.dart';
import 'package:bookshelf/shared/infra/books/port/books_repository.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:googleapis/books/v1.dart';
import 'package:http/http.dart';

class GoogleBooksRepository extends BooksRepository {
  final _booksApi = BooksApi(Client());

  @override
  Future<IList<BookLite>?> getBooksFiltered(String filter) async {
    final response = await _booksApi.volumes.list(filter);
    return _adaptVolumesToBookLite(response);
  }
}

IList<BookLite>? _adaptVolumesToBookLite(Volumes volumes) {
  return volumes.items
      ?.map((volume) {
        final title = volume.volumeInfo?.title;
        final authors = volume.volumeInfo?.authors;
        final description = volume.volumeInfo?.description;
        final thumbnailUrl = volume.volumeInfo?.imageLinks?.thumbnail;

        if (title == null ||
            authors == null ||
            description == null ||
            thumbnailUrl == null) {
          return null;
        }
        return BookLite(
          title: title,
          authors: authors.toIList(),
          description: description,
          thumbnailUrl: thumbnailUrl,
        );
      })
      .nonNulls
      .toIList();
}
