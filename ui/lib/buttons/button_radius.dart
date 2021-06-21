import 'package:flutter/material.dart';
import 'package:ui/style/style.dart';

// ignore: must_be_immutable
class ButtonRadius extends StatefulWidget {
  double? height;
  double? width;
  String? label;
  Color? textColor;
  Color? background;

  ButtonRadius(
      {this.height,
      this.width,
      this.label,
      this.textColor,
      this.background,
      Key? key})
      : super(key: key);

  @override
  _ButtonRadiusState createState() => _ButtonRadiusState();
}

class _ButtonRadiusState extends State<ButtonRadius> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 0.0,
      width: widget.width ?? null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mSizeButtonRadius),
        color: widget.background ?? Colors.white,
      ),
      child: Center(
        child: Text(
          widget.label ?? "",
          style: TextStyle(
            fontSize: mSizeTextSecondary,
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? mColorTextSecondary,
          ),
        ),
      ),
    );
  }
}
