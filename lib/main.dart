import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: QuestionsAppContainer(Color.fromARGB(255, 78, 13, 151), Color.fromARGB(255, 107, 15, 168)),
      ),
    ),
  );
}

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class QuestionsAppContainer extends StatelessWidget {
  const QuestionsAppContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;                                    

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 300,),
            const SizedBox(height: 100),
            Text(
              "Learn Flutter the fun way",
              style: TextStyle(fontSize: 30, color: Colors.white, ),
            ),
            OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
