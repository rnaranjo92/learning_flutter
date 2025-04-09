import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/home_container.dart';
import 'package:learning_flutter/pages/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;


class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = HomeAppContainer(switchScreen);
    super.initState();
  }

  switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container (
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151), 
              Color.fromARGB(255, 107, 15, 168)],
              begin: startAlignment,
              end: endAlignment,
              ),
          ),
        child: activeScreen,
        ),
      ),
    );
  }
}

