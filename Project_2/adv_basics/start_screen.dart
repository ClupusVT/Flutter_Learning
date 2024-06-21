import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});//It means that we pass the function here as an argument

  final startAlignment = Alignment.topLeft;
  final endAlignment = Alignment.topRight;
  final void Function() startQuiz; //declare a variable here

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300, color: const Color.fromARGB(150,255,255,255)),
          // Opacity(
          //   opacity: 0.6, //This mean opacity is a object contains images
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          const SizedBox(height: 40),
          const Text(
            'Learning Flutter',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20), // Add some space
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt), //Add icon for button
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
