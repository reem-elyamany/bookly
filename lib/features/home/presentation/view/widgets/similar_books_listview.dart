import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
          return  SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookImage(
                  imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              );
            }),
          ),
        );
        }
        else if(state is SimilarBooksFailure){
          return Center(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
