import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;

  var questions = [
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 8},
        {'text': 'Cheetah', 'score': 6},
        {'text': 'Elephant', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite Color?',
      'answerText': [
        {'text': 'Green', 'score': 10},
        {'text': 'White', 'score': 8},
        {'text': 'Grey', 'score': 6},
        {'text': 'Black', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite Food?',
      'answerText': [
        {'text': 'Biryani', 'score': 10},
        {'text': 'Pasta', 'score': 8},
        {'text': 'Sandwich', 'score': 6},
        {'text': 'Burger', 'score': 4},
      ]
    },
  ];
  int _totalScore = 0;
  String resultText='';
  void reset() {
    questionIndex = 0;
    _totalScore=0;
    setState(() {});
  }
  String get result{
    if(_totalScore>20)
    {
      resultText='Your Awesome!';
    }
    else if(_totalScore>15)
    {
      resultText= 'Your Average!';
    }
    else
    {
      resultText='Your so Bad!';
    }
    return resultText;
  }
  void changeQuestion(int score) {
    setState(() {
      _totalScore+=score;
      questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personality Test App'),
        backgroundColor: Colors.blue,
      ),
      body: questionIndex < questions.length
          ? Column(
              children: [
                Center(
                  child: Text(
                    questions[questionIndex]['questionText'].toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                ...(questions[questionIndex]['answerText']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: ()=>changeQuestion(answer['score'] as int),
                        child: Text(
                          answer['text'].toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ));
                }).toList(),
              ],
            )
          : Column(
              children: [
                 Center(
                  child: Text(
                    result,
                    style: const TextStyle(fontSize: 20,),
                  ),
                ),
                TextButton(
                    onPressed: reset,
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ))
              ],
            ),
    );
  }

}
