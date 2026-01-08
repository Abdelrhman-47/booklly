
import '../../domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  final String? kind;
  final int? totalItems;
  final List<Items>? items;

  const BookModel({
    this.kind,
    this.totalItems,
    this.items,
    required String bookId,
    String? image,
    required String title,
    String? authorName,
    num? price,
    num? rating,
  }) : super(
    bookId: bookId,
    image: image,
    title: title,
    authorName: authorName,
    price: price,
    rating: rating,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      kind: json['kind'],
      totalItems: json['totalItems'],
      items: (json['items'] as List<dynamic>?)
          ?.map((v) => Items.fromJson(v))
          .toList(),
      bookId: json['id'] ?? '',
      image: json['volumeInfo']?['imageLinks']?['thumbnail'],
      title: json['volumeInfo']?['title'] ?? '',
      authorName: (json['volumeInfo']?['authors'] != null &&
          (json['volumeInfo']['authors'] as List).isNotEmpty)
          ? json['volumeInfo']['authors'][0]
          : null,
      price: json['saleInfo']?['listPrice']?['amount'],
      rating: json['volumeInfo']?['averageRating'],
    );
  }
}


class Items {
  final String? id;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;

  Items({this.id, this.volumeInfo, this.saleInfo});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfo.fromJson(json['volumeInfo'])
          : null,
      saleInfo: json['saleInfo'] != null
          ? SaleInfo.fromJson(json['saleInfo'])
          : null,
    );
  }
}


class VolumeInfo {
  final String? title;
  final List<String>? authors;
  final num? averageRating;
  final ImageLinks? imageLinks;

  VolumeInfo({
    this.title,
    this.authors,
    this.averageRating,
    this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title'],
      authors: json['authors'] != null
          ? List<String>.from(json['authors'])
          : null,
      averageRating: json['averageRating'],
      imageLinks: json['imageLinks'] != null
          ? ImageLinks.fromJson(json['imageLinks'])
          : null,
    );
  }
}


class SaleInfo {
  final ListPrice? listPrice;

  SaleInfo({this.listPrice});

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      listPrice: json['listPrice'] != null
          ? ListPrice.fromJson(json['listPrice'])
          : null,
    );
  }
}


class ListPrice {
  final num? amount;

  ListPrice({this.amount});

  factory ListPrice.fromJson(Map<String, dynamic> json) {
    return ListPrice(amount: json['amount']);
  }
}

  
class ImageLinks {
  final String? thumbnail;

  ImageLinks({this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(thumbnail: json['thumbnail']);
  }
}
