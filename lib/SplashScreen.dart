import 'dart:async';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen Demo',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return Center(
              child: CustomPaint(
                painter: SplashScreenPainter(),
                child: Container(
                  width: 400,
                  height: 400,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class SplashScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Dessinez la forme personnalisée ici
    RRect rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 3, size.height / 2),
        width: 500,
        height: 100,
      ),
      Radius.circular(20),
    );

    canvas.drawRRect(rRect, paint);
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'Convertisseur Expérimental',
        style: TextStyle(
          color: const Color.fromARGB(255, 213, 92, 92),
          fontSize: 28.0,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    textPainter.paint(
        canvas, Offset((size.width - textPainter.width) / 2, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
