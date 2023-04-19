import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class BottomCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.7621528,size.height*0.2009346);
    path_0.cubicTo(size.width*0.6916806,size.height*0.1729140,size.width*0.6105486,size.height*0.1932654,size.width*0.5465903,size.height*0.2209551);
    path_0.cubicTo(size.width*0.4740104,size.height*0.2523794,size.width*0.3982500,size.height*0.2278467,size.width*0.3350441,size.height*0.1267953);
    path_0.cubicTo(size.width*0.2516958,size.height*-0.006459009,size.width*0.1503163,size.height*-0.03009916,size.width*0.05969549,size.height*0.06258804);
    path_0.lineTo(size.width*0.02951389,size.height*0.09345794);
    path_0.lineTo(0,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width*0.9945313,size.height*0.8881121);
    path_0.cubicTo(size.width*0.9923958,size.height*0.8444570,size.width*0.9885833,size.height*0.8017346,size.width*0.9818194,size.height*0.7616449);
    path_0.cubicTo(size.width*0.9570451,size.height*0.6148131,size.width*0.8838229,size.height*0.2493140,size.width*0.7621528,size.height*0.2009346);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(size.width*0.3871528,size.height*0.9112150), Offset(size.width*1.052083,size.height*-21.96262), [Colors.grey.withOpacity(0.05),Colors.white.withOpacity(0.1)], [0,1]);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class TopCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.006782680,size.height*0.006274803);
    path_0.cubicTo(size.width*0.006782672,size.height*0.1359820,size.width*0.03233041,size.height*0.2644189,size.width*0.08196721,size.height*0.3842533);
    path_0.cubicTo(size.width*0.1316041,size.height*0.5040869,size.width*0.2043582,size.height*0.6129705,size.width*0.2960746,size.height*0.7046877);
    path_0.cubicTo(size.width*0.3877918,size.height*0.7964049,size.width*0.4966754,size.height*0.8691557,size.width*0.6165090,size.height*0.9187951);
    path_0.cubicTo(size.width*0.7363434,size.height*0.9684344,size.width*0.8647787,size.height*0.9939836,size.width*0.9944836,size.height*0.9939836);
    path_0.lineTo(size.width*0.9944836,size.height*0.006274861);
    path_0.lineTo(size.width*0.006782680,size.height*0.006274803);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = const Color(0xffc4c4c4).withOpacity(0.03);
    canvas.drawPath(path_0,paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.006782680,size.height*0.006274803);
    path_1.cubicTo(size.width*0.006782672,size.height*0.1359820,size.width*0.03233041,size.height*0.2644189,size.width*0.08196721,size.height*0.3842533);
    path_1.cubicTo(size.width*0.1316041,size.height*0.5040869,size.width*0.2043582,size.height*0.6129705,size.width*0.2960746,size.height*0.7046877);
    path_1.cubicTo(size.width*0.3877918,size.height*0.7964049,size.width*0.4966754,size.height*0.8691557,size.width*0.6165090,size.height*0.9187951);
    path_1.cubicTo(size.width*0.7363434,size.height*0.9684344,size.width*0.8647787,size.height*0.9939836,size.width*0.9944836,size.height*0.9939836);
    path_1.lineTo(size.width*0.9944836,size.height*0.006274861);
    path_1.lineTo(size.width*0.006782680,size.height*0.006274803);
    path_1.close();

    Paint paint1Fill = Paint()..style=PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(Offset(size.width*1.069672,size.height*-323.7705), Offset(size.width*1.069672,size.height*-126.2295), [Colors.grey.withOpacity(0.1),Colors.grey.withOpacity(0)], [0,1]);
    canvas.drawPath(path_1,paint1Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}