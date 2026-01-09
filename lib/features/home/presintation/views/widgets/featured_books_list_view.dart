import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';

import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});
final List <BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(scrollDirection: Axis.horizontal,
      itemCount: books.length,
        itemBuilder: (ctx, index) {
          final book =books[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomListViewItem(imageUrl: book.image!,),
          );
          
        },
      ),
    );
  }
}
