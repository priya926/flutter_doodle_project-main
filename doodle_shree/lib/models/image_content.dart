import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';

/// Custom drawn image
/// url: https://web-strapi.mrmilu.com/uploads/flutter_logo_470e9f7491.png
// const String _imageUrl = 'https://web-strapi.mrmilu.com/uploads/flutter_logo_470e9f7491.png';

class ImageContent extends PaintContent {
  ImageContent(this.image, {this.imagePath = ''});

  ImageContent.data({
    required this.startPoint,
    required this.size,
    required this.image,
    required this.imagePath,
    required Paint paint,
  }) : super.paint(paint);

  factory ImageContent.fromJson(Map<String, dynamic> data) {
    return ImageContent.data(
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      size: jsonToOffset(data['size'] as Map<String, dynamic>),
      imagePath: data['imageUrl'] as String,
      image: data['image'] as ui.Image,
      paint: jsonToPaint(data['paint'] as Map<String, dynamic>),
    );
  }

  Offset startPoint = Offset.zero;
  Offset size = Offset.zero;
  final String imagePath;
  final ui.Image image;

  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) => size = nowPoint - startPoint;

  @override
  void draw(Canvas canvas, Size size, bool deeper) {
    final Rect rect = Rect.fromPoints(startPoint, startPoint + this.size);
    paintImage(canvas: canvas, rect: rect, image: image, fit: BoxFit.fill);
  }

  @override
  ImageContent copy() => ImageContent(image);

  @override
  Map<String, dynamic> toContentJson() {
    return <String, dynamic>{
      'startPoint': startPoint.toJson(),
      'size': size.toJson(),
      'imageUrl': imagePath,
      'paint': paint.toJson(),
    };
  }
}
