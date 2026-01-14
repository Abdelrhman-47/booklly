import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key,});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (ctx, index) { //final BookEntity book = books[index];
         return   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BookListViewItem(//book: book
          ),
        );
      },
        childCount:7 //books.length, 
      ),
    );
  }
}
