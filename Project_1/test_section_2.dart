import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(//widget provided by the Flutter framework
      home: Scaffold(//layout structure with app bars, drawers, and many other features.
        backgroundColor: Colors.purple,//This require a colors not a widget
        body: GradientContainerFlexStateful(Colors.blue,Colors.yellow),//Constructed Widget
      ),
    ),
  );
}



