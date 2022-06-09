import 'package:clubhouse/utilities/constant.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.style,
    required this.borderRadius,
  }) :  super(key: key);


  final VoidCallback? onPressed;
  final String? text;
  final TextStyle? style;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(

      elevation: 3.0,
      borderRadius: borderRadius,
      color: Colors.blue,
      child: MaterialButton(
        onPressed: onPressed,
        child:  Text(text!,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}