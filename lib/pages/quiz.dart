import 'package:flutter/material.dart';
import 'package:learning_flutter/data/questions.dart';
import 'package:learning_flutter/models/quiz_question.dart';
import 'package:learning_flutter/pages/home_container.dart';
import 'package:learning_flutter/pages/questions_screen.dart';
import 'package:learning_flutter/pages/result_screen.dart';

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
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  returnScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }


  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeAppContainer(switchScreen); 
    
    if (activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } 

    if (activeScreen == 'results-screen'){
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, returnHome: returnScreen);
    } 

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
        child: screenWidget,
        ),
      ),
    );
  }
}

