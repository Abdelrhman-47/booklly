
import 'dart:developer';

import 'package:booklly/core/erreors/failur.dart';
import 'package:booklly/core/utiles/styles.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_cubit.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';
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
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Text('Best Seller', style: Styles.textStyle30),
              ),
            ),
    
            BestSellerListView(),
          ],
        );
      
      
    
  }
}
