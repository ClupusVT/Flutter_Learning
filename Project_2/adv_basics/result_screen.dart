import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/models/question_summary.dart';


class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers,required this.restartQuiz});
  final void Function() restartQuiz;
  final List<String> chosenAnswers;
  List<Map<String, Object>> get summaryData{//getSummary data = get Summary
    final List<Map<String, Object>> summary = [];
    for (var i =0; i < chosenAnswers.length; i++){//Take a part of question.dart(questions and correct answer to craft a new data)
      List<int> userAnswerCorrectIds = [];
      for (var i = 0; i < chosenAnswers.length; i++) {
        if (chosenAnswers[i] == questions[i].answer[0]) {
          userAnswerCorrectIds.add(i);
        }
      }
      summary.add({
        'question_index':i,
        "question": questions[i].textQuestion,
        'chosen_answer':chosenAnswers[i],
        'correct_answer':questions[i].answer[0],
        'user_answer_correct_id': userAnswerCorrectIds,
      });
    }
    return summary;
  }


  @override
  Widget build(BuildContext context) {
    //final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // final numCorrectAnswer = summaryData.where((data){
    //   return data['chosen_answer'] == data['correct_answer'];
    // }).length;
    final numCorrectAnswer = summaryData.where((data) => data['chosen_answer'] == data['correct_answer']).length;//Other way to make a condition
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "You answered $numCorrectAnswer out of $numTotalQuestions questions correctly !!!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
              ),
              SizedBox(height: 30),
              QuestionsSummary(summaryData: summaryData),
              SizedBox(height: 30,),
              OutlinedButton.icon(
                onPressed: () {
                  restartQuiz();
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.arrow_right_alt), //Add icon for button
                label: const Text('Restart Quiz'),
              ),

            ],
          ),
        ),
      );
  }
}