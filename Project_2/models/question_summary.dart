import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question_summary.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String,Object>> summaryData;


  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 300,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map(
                    (data) {
                        return Row(children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                color: (data['user_answer_correct_id'] as List<int>).contains(data['question_index']) ? Colors.blue : Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                (((data['question_index'] as int) +1).toString()),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  (data['question'] as String),
                                  // textAlign: TextAlign.left, // Aligns text to the left
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      (data['chosen_answer'] as String),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17

                                      ),
                                  )),

                              Container(

                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      (data['correct_answer'] as String),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17

                                      ),
                                  ),
                              ),
                            ],),
                          )
                        ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}