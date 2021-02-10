import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10, 10, 120, 120);
  }

  @override
  // ignore: missing_return
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
  }
  
}