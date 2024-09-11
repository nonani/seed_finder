import 'package:flutter/widgets.dart';

import '../utils/theme.dart';

class CdnImage extends StatelessWidget {
  final String? src;
  final double? width;
  final double? height;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxFit? fit;
  final Widget fallback;

  const CdnImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.boxShadow,
    this.fit = BoxFit.cover,
    required this.fallback,
  });

  CdnImage.circle(
    this.src, {
    super.key,
    required double dimension,
    this.boxShadow,
    this.fit = BoxFit.cover,
    required this.fallback,
  })  : width = dimension,
        height = dimension,
        borderRadius = BorderRadius.all(Radius.circular(dimension / 2));

  @override
  Widget build(BuildContext context) {
    final src = this.src;
    final image = src == null || src.isEmpty
        ? fallback
        : Image.network(
            //TODO: Replace with actual CDN URL
            "https://avatars.githubusercontent.com/u/30969164?s=96&v=4",
            fit: fit,
            errorBuilder: (context, error, stackTrace) => fallback,
          );

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: gray100,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: image,
        ),
      ),
    );
  }
}
