import 'package:flutter/material.dart';

import '../theme.dart';

class MyButton extends StatelessWidget {
  void Function() onTap;
  String text;
  MyButton({
    required this.text,
    required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onTap,
        child: Container(
          alignment: Alignment.center,
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            color: primaryClr,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(text , style: TextStyle(color: Colors.white, fontSize: 15)),
        )
    );
  }
}
