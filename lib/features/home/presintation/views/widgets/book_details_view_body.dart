import 'package:flutter/material.dart';

import '../../../../../core/utiles/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_list_view_item.dart';
import 'custome_appbar_details.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomeAppbarDetails(),
            SizedBox(height: 300, child: CustomListViewItem()),
            SizedBox(height: 43),
            Text(
              'The Jungle Book',
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Opacity(
              opacity: .7,
              child: Text(
                'Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const BookRating(mainAxisAlignment: MainAxisAlignment.center),
            const SizedBox(height: 37),
            BooksAction(),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text('You Can Also Like',style: Styles.textStyle14.copyWith(),)),
            ),SimilerBooksListView()
          ],
        ),
      ),
    );
  }
}
class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      height: MediaQuery.of(context).size.height * .17,
      child:  ListView.builder(scrollDirection: Axis.horizontal,
    itemBuilder: (ctx, index) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CustomListViewItem(),
    );
  }));
}
}