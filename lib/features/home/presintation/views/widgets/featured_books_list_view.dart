import 'package:booklly/core/erreors/failur.dart';
import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_cubit.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  int pageNumbr = 1;

  @override
  void initState() {
    _scrollController.addListener(cheackToUpdate);
    super.initState();
  }

  void cheackToUpdate() async {
    double currentPositio = _scrollController.position.pixels;
    double endPosition = _scrollController.position.maxScrollExtent * .7;
    if (currentPositio >= endPosition && !isLoadingMore) {
      if (!isLoadingMore) {
        isLoadingMore = true;
        await context.read<FeatuerBookCubit>().featchFeatueredBooks(
          pageNumbr: pageNumbr++,
        );
        isLoadingMore = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<BookEntity> allBooks = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: BlocConsumer<FeatuerBookCubit, FeatuerBookState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (books) => allBooks.addAll(books),
            orElse: () {},
            loading: () {
              isLoading = true;
            },
          );
        },

        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (List<BookEntity> books) {
              return Skeletonizer(
                enabled: isLoading,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: allBooks.length,
                  itemBuilder: (ctx, index) {
                    final book = allBooks.isEmpty
                        ? BookEntity(bookId: '', title: '')
                        : allBooks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomListViewItem(imageUrl: book.image ?? 'as'),
                    );
                  },
                ),
              );
            },
            error: (Failure error) => Center(child: Text('Error is $error')),
          );
        },
      ),
    );
  }
}
