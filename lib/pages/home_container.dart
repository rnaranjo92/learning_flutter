// ignore: file_names
import 'package:flutter/material.dart';


class HomeAppContainer extends StatelessWidget {
  const HomeAppContainer(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png', 
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255)  
            ),
            const SizedBox(height: 80),
            Text(
              "Learn Flutter the fun way",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
  }
}
