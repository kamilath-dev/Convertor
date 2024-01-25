import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';
import 'Convertor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: CustomPaint(
        painter: MyCustomPainter(),
        child: Center(
          child: Text('Bienvenue',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 202, 132),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Connexion'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              title: Text('Inscription'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
            ),
            ListTile(
              title: Text('Convertisseur'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Convertor()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Dessinez la forme personnalisée ici
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
