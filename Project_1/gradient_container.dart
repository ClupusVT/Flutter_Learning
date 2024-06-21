import 'dart:ui';

import 'package:flutter/material.dart';
import 'diceRoller.dart';
import 'section_2_style.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment
    .bottomRight; //final means that this variable will not receive a new value

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    //Initialization working
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // This must remove the const here because all
          // while var is unstable -> it breaks the logical
          gradient: LinearGradient(
        colors: const [Colors.black, Colors.yellow],
        begin: startAlignment,
        end: endAlignment,
      )),
      child: Center(
        child: Container(
          color: Colors.redAccent,
          padding: const EdgeInsets.all(10),
          child: StyledText("Pentest 5"),//This require an agrument here
        ),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
   StyledText( this.text, {super.key});

  String text ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.brown, fontSize: 25),// This variable should be stable
    );
  }
}


class GradientContainerFlex extends StatelessWidget {
  const GradientContainerFlex( this.color1, this.color2,{super.key});//setup a constructor for a widget
  const GradientContainerFlex.purple({super.key})
        : color1 = Colors.deepPurple,
          color2 = Colors.indigo;

  final Color color1;
  final Color color2;
  final activeDiceImage = "assets/dice-images/dice-1.png";
  void rollDice()
  {
    var activeDiceImage = "assets/dice-images/dice-2.png";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          // This must remove the const here because all
          // while var is unstable -> it breaks the logical
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: startAlignment,
              end: endAlignment,
            )),
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,//The mainAxisSize property determines how much space the widget's main axis should occupy
                children: [
                  Image.asset(activeDiceImage, width: 200),
                  const SizedBox(height: 20),//Fixed size that not impact this box
                  TextButton(
                      style:TextButton.styleFrom(backgroundColor: Colors.blue,
                          //padding:const EdgeInsets.only(top:30),// the EdgeInsets class is used to represent the insets or padding around a widget
                          textStyle:const TextStyle(fontSize:28)),
                      onPressed: rollDice,
                      child: const Text("Role Dice")
                      )
                ])
        )
    );
   }
}

class GradientContainerFlexStateful extends StatelessWidget {
  const GradientContainerFlexStateful( this.color1, this.color2,{super.key});
  // const GradientContainerFlexStateful.purple({super.key})
  //     : color1 = Colors.deepPurple,
  //       color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(//This is the box outside the dice and it not changed so it should be stateless
          // This must remove the const here because all
          // while var is unstable -> it breaks the logical
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: startAlignment,
              end: endAlignment,
            )),
        child: const Center(
            child: diceRoller(),//Here is the widget with stateful class contains the images of dice
        )
    );
  }
}




