import 'dart:math';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,this.text}) : super(key: key);
String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: double.infinity,
      height: 60.0,
      child:  Center(
        child: Text(text!,style: TextStyle(fontSize: 20.0),),
      ),
    );
  }
}
