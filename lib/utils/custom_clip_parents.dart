import 'package:flutter/cupertino.dart';

class ParentClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 10, 120, 130);
  }

  @override
  // ignore: missing_return
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
  }

}