import 'package:flutter/material.dart';
import 'package:Convertor/DevicesScreen.dart';
import 'package:Convertor/LongueurScreen.dart';
import 'package:Convertor/PoidsScreen.dart';
import 'package:Convertor/TemperatureScreen.dart';

class Convertor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DevicesScreen()),
                    );
                  },
                  child: const Text('Devices')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LongueurScreen()),
                    );
                  },
                  child: const Text('Longueur')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PoidsScreen()),
                    );
                  },
                  child: const Text('Masse')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TemperatureScreen()),
                    );
                  },
                  child: const Text('Température')),
            )
          ],
        ),
      ),
    );
  }
}
