import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final List<String> getAnswers;
  final Function questionHandler;
  const Answers({super.key, required this.getAnswers, required this.questionHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: (){}, child: Text(getAnswers as String))
      ],
    );
  }
}
