import 'package:bookly/features/home/presentation/manager/feature_books_cubit/cubit/feature_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/news_books/cubit/news_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/BestSeler_listview.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBooksCubit, NewsBooksState>(
        builder: (context, state) {
      if (state is NewsBooksSuccess) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItem(bookModel: state.books[index],),
            );
          },
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(errMessage: state.errmessage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
