import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class networkImage extends StatelessWidget {
  final dynamic width;

  final dynamic height;

  final dynamic url;

  final dynamic fit;

  const networkImage({
    super.key,
    required this.width,
    required this.height,
    required this.url,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      // placeholder: (context, url) => Container(),
    );
  }
}
