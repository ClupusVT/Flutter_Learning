import 'package:flutter/material.dart';
import 'question_screen.dart';
import 'start_screen.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quizstate();
  }
}

class _Quizstate extends State<Quiz>{//Underscore (_lead) to the private property
   List<String> selectedAnswer =[];//final is not reassigned but can add another to object
  //need to reset selectedAnswer per loop
  // Widget ?activeScreen; //? Meaning activeScreen could be null
  //
  // void initState(){
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState(); //Set initiate state for created object
  // }
  var activeScreen = 'start-screen';
  void switchScreen(){//switchScreen does not take any  argument
    setState(() {
      activeScreen ='question-screen';
    });
  }
  void chooseAnswer(String answer){//switchScreen does not take any  argument
      selectedAnswer.add(answer);
      if (selectedAnswer.length == questions.length){
        setState(() {
          activeScreen ='result-screen';
        });
      }
  }
   void restartScreen(){//switchScreen does not take any  argument
     setState(() {
       activeScreen ='start-screen';
     });
   }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen'){
     //ScreenWidget = ResultsScreen(chosenAnswers: selectedAnswer);
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswer, restartQuiz: restartScreen);
      selectedAnswer =[];
    }


   return MaterialApp(
     home: Scaffold(
       body: Container(
         decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Color.fromARGB(255, 78, 13, 151),
               Color.fromARGB(255, 107, 15, 168),
             ],
             begin: Alignment.topLeft,
             end: Alignment.topRight,
           ),
         ),
         child: screenWidget
       ),
     ),
   );
  }
}