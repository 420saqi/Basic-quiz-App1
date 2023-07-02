import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

    @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Your Result here',
            style: TextStyle(fontSize: 24),
          ),
        ),
        TextButton(
            onPressed:(){},
            child: const Text('Reset',
                style: TextStyle(fontSize: 24, color: Colors.blue)))
      ],
    );
  }
}
