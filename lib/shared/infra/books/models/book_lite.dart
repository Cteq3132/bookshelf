import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class BookLite extends Equatable {
  const BookLite({
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnailUrl,
  });

  final String title;
  final IList<String> authors;
  final String description;
  final String thumbnailUrl;

  @override
  List<Object?> get props => [
        title,
        authors,
        description,
        thumbnailUrl,
      ];
}
