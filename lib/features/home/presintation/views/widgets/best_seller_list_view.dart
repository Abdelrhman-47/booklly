import 'package:flutter/material.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (ctx, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BookListViewItem(),
        ),
        childCount: 10, // مهم تحدد عدد العناصر
      ),
    );
  }
}
