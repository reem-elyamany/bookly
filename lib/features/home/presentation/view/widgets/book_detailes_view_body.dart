import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/BookRating.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_action.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_details_appbar.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:bookly/features/home/presentation/view/widgets/similar_books_listview.dart';

import 'package:flutter/material.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  bookModel.volumeInfo.title!,
                  style:
                      Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(bookModel.volumeInfo.authors?[0] ?? '',
                      style: Styles.textStyle18.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRating(
                  rating: bookModel.volumeInfo.averageRating ?? 0,
                  count: bookModel.volumeInfo.ratingsCount ?? 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                const BookAction(),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You can also like',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                SimilarBooksListview(),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
