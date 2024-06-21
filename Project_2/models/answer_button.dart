//This for designing button widget
import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key,required this.answerText, required this.onTap});
  //const AnswerButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build (BuildContext context){
    return ElevatedButton(
      onPressed: onTap, // Empty callback function
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(answerText,textAlign: TextAlign.center),
    );
  }
}