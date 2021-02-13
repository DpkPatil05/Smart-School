import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 130, 130);
  }

  @override
  // ignore: missing_return
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
  }
  
}