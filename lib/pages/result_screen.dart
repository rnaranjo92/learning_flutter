import 'package:flutter/material.dart';
import 'package:learning_flutter/data/questions.dart';
import 'package:learning_flutter/pages/home_container.dart';
import 'package:learning_flutter/pages/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers, required this.returnHome});

  List<String> chosenAnswers;
  final void Function() returnHome;
  

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length; 
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;



    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            style: TextStyle(
              color: Color.fromARGB(255, 206, 162, 255), 
              fontSize: 21,
              ),
            textAlign: TextAlign.center,  
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(height: 30),
          
            OutlinedButton.icon(onPressed: () {
              chosenAnswers = [];
              returnHome();
            }, label: const Text('Restart Quiz', style: TextStyle(color: Colors.white),),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh, color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
