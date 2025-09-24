class BookEntity  {
  final String bookId;
  final String? image;
  final String title;
  final String? authorName;
  final num? price;
  final num? rating;

  const BookEntity({
    required this.bookId,
    this.image,
    required this.title,
    this.authorName,
    this.price,
    this.rating,
  });

  @override
  List<Object?> get props => [bookId, image, title, authorName, price, rating];
}