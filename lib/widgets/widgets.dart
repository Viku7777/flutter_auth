import 'package:flutter/material.dart';

textwidget(String text, Color color, double size) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size),
  );
}

nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

nextScreenReplacement(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
