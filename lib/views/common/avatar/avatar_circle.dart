import 'package:configuration/utility/image_provide.dart';
import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String url;
  final double size;

  const AvatarCircle({
    required this.url,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: loadAvatar(url, size, size),
    );
  }
}
