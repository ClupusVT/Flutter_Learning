import 'package:flutter/material.dart';
import 'dart:math';

class diceRoller extends StatefulWidget {//StatefulWidget widgets have associated mutable state that can change over time,
  //This widget is stateful, it changes the images depend on the role dice and requires state control
  const diceRoller({super.key});
  @override
  State<diceRoller> createState(){
    return _DiceRollerState();
  }
}
class _DiceRollerState extends State<diceRoller>{//manages the state of the diceRoller widget.
  //This class control the state, depend on the output
  var currentRollDice = 2;
  void rollDice()//It updates the state of the _DiceRollerState class, causing the UI to rebuild and display the new dice image
  {
    setState(() {// function is called to update the state
       currentRollDice = Random().nextInt(6) + 1;//This means from 1 to 6
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,//The mainAxisSize property determines how much space the widget's main axis should occupy
                children: [
                  Image.asset("assets/dice-images/dice-$currentRollDice.png", width: 200),
                  const SizedBox(height: 20),//Fixed size that not impact this box
                  TextButton(
                      style:TextButton.styleFrom(backgroundColor: Colors.blue,
                          //padding:const EdgeInsets.only(top:30),// the EdgeInsets class is used to represent the insets or padding around a widget
                          textStyle:const TextStyle(fontSize:28)),
                      onPressed: rollDice,
                      child: const Text("Role One Dice")
                  )
                ])
        )
    );
  }
}