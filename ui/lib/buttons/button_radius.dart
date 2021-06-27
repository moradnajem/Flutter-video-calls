import 'package:flutter/material.dart';
import 'package:ui/style/style.dart';

// ignore: must_be_immutable
class ButtonRadius extends StatefulWidget {
  double? height;
  double? width;
  double? radius;
  String? label;
  Color? textColor;
  Color? background;
  bool? enable;
  VoidCallback? callback;

  ButtonRadius(
      {this.height,
      this.width,
      this.radius,
      this.label,
      this.textColor,
      this.background,
      this.enable,
      this.callback,
      Key? key})
      : super(key: key);

  @override
  _ButtonRadiusState createState() => _ButtonRadiusState();
}

class _ButtonRadiusState extends State<ButtonRadius> {
  @override
  Widget build(BuildContext context) {
    return widget.enable == null || widget.enable == true
        ? GestureDetector(
            onTap: widget.callback,
            child: Container(
              height: widget.height ?? 0.0,
              width: widget.width ?? null,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(widget.radius ?? mSizeButtonRadius),
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
            ),
          )
        : Container(
            height: widget.height ?? 0.0,
            width: widget.width ?? null,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(widget.radius ?? mSizeButtonRadius),
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                widget.label ?? "",
                style: TextStyle(
                  fontSize: mSizeTextSecondary,
                  fontWeight: FontWeight.bold,
                  color: mColorTextSecondary,
                ),
              ),
            ),
          );
  }
}
