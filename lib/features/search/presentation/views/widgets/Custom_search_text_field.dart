import 'package:bookly/features/search/presentation/views/widgets/text_field_body.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldBody(),
      ],
    );
  }
}
