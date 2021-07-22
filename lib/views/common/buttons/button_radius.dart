import 'package:flutter/material.dart';
import 'package:flutter_video_calls/style/style.dart';

class ButtonRadius extends StatefulWidget {
  final double? height;
  final double? width;
  final double? radius;
  final String? label;
  final Color? textColor;
  final Color? background;
  final bool? enable;
  final VoidCallback? callback;

  const ButtonRadius(
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
              height: widget.height ?? mSizeButton,
              width: widget.width ?? null,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.radius ?? 5.0)),
                color: widget.background ?? Colors.white,
              ),
              child: Center(
                child: Text(
                  widget.label ?? "",
                  style: mActionTextStyle.copyWith(
                    color: widget.textColor ?? mColorTextTitle,
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: widget.height ?? mSizeButton,
            width: widget.width ?? null,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.radius ?? 5.0)),
              color: mColorBorder,
            ),
            child: Center(
              child: Text(
                widget.label ?? "",
                style: mActionTextStyle,
              ),
            ),
          );
  }
}
