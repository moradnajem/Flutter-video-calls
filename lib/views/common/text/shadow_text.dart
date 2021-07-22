import 'package:flutter/material.dart';
import 'package:flutter_video_calls/style/style.dart';

class ShadowText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;

  const ShadowText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
  });

  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Text(
            data,
            style: style?.copyWith(
              shadows: [
                Shadow(
                  color: mCallBackground.withOpacity(0.3),
                  offset: Offset(0.2, 0.2),
                  blurRadius: 5.0,
                ),
              ],
            ),
            textAlign: textAlign,
            textDirection: textDirection,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
