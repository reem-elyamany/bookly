import 'package:bookly/features/home/presentation/view/widgets/BestSeler_listview.dart';
import 'package:flutter/material.dart';

class SearchResoltListview extends StatelessWidget {
  const SearchResoltListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
         // child: BookListViewItem( ,),
        );
      },
    );
  }
}
