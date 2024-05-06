import 'package:bookshelf/modules/book_search/infra/book_search_signals.dart';
import 'package:bookshelf/modules/book_search/view/widgets/book_lite_list.dart';
import 'package:flutter/material.dart';

class BookSearchView extends StatelessWidget {
  const BookSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Search')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (newValue) => searchText.set(newValue),
              decoration: const InputDecoration(
                labelText: 'Search',
              ),
            ),
            const SizedBox(height: 16),
            const BookLiteList(),
          ],
        ),
      ),
    );
  }
}
