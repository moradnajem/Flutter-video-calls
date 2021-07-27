import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

String logo = 'assets/images/logo.jpg';

CachedNetworkImage loadAvatar(String url, double width, double height) =>
    CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
