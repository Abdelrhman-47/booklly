import 'package:booklly/core/utiles/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'best_seller_list_view_item.dart';
import 'custom_appbar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomAppbar()),
        SliverToBoxAdapter(child: FeaturedBooksListView()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text('Best Seller', style: Styles.textStyle30),
          ),
        ),

        BestSellerListView(),
      ],
    );
  }
}
