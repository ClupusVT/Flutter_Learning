import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/answer_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState(){
    return _QuestionScreenstate();
  }
}

class _QuestionScreenstate extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectAnswer){
    //Access the widget property : onSelectedAnswer (function)
    widget.onSelectAnswer(selectAnswer);//This is void function that prevent main function return the value.
    setState(() { //update the state of the _QuestionScreenstate object.
      currentQuestionIndex++;
    });
}

  @override
  Widget build(BuildContext context) {
    final CurrentQuestion = questions[currentQuestionIndex];//This define the question order
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),//alignment both side
        child: Column(//requires a list of widget
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Text(
                CurrentQuestion.textQuestion,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 134, 169, 210),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 30),
              //... The problem here this child column
              // requires a list of widget instead a iterable value , then we need ... here
              // which convert iterable string into a widget ( follow the same format with the other widget
              //implemented here
             ...CurrentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: (){answerQuestion(answer);}, // an anonymous function is passed as the value of the onTap property.
              );
            }),
          ],
        ),
      ),
    );
  }
}
