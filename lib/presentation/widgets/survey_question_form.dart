import 'package:flutter/material.dart';

class ChoiceQuestion extends StatelessWidget {
  final String question;
  final List<String> options;

  const ChoiceQuestion({
    Key? key,
    required this.question,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );
  }
}
