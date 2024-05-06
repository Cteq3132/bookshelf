import 'package:bookshelf/modules/book_search/domain/errors.dart';
import 'package:bookshelf/modules/book_search/infra/book_search_signals.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class BookLiteList extends StatelessWidget {
  const BookLiteList({super.key});

  @override
  Widget build(BuildContext context) {
    final booksLite$ = bookSearchSignals.watch(context);
    return booksLite$.map(
      data: (booksLite) => Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: booksLite.length,
          itemBuilder: (context, index) {
            final bookLite = booksLite[index];
            return ListTile(
              leading: Image.network(bookLite.thumbnailUrl),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(bookLite.authors.join(', ')),
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(bookLite.title),
              ),
            );
          },
        ),
      ),
      error: (error) => switch (error.runtimeType) {
        SearchTextIsEmptyException => const SizedBox.shrink(),
        _ => Center(child: Text('Error: $error'))
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
