import 'package:flutter/material.dart';

class LongueurScreen extends StatefulWidget {
  @override
  _LengthScreenState createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LongueurScreen> {
  String selected_unit = 'Meter';
  String convert_unit = 'Meter';
  double inputValue = 0;
  double convertedValue = 0;

  // Ratios de conversion constants
  static const double kmToMeter = 1000;
  static const double cmToMeter = 0.01;
  static const double hmToMeter = 100;
  static const double damToMeter = 10;
  static const double dmToMeter = 0.1;
  static const double mmToMeter = 0.001;

  void convert() {
    setState(() {
      double meterValue;

      if (selected_unit == 'Meter') {
        meterValue = inputValue;
      } else {
        switch (selected_unit) {
          case 'Kilometer':
            meterValue = inputValue * kmToMeter;
            break;
          case 'Centimeter':
            meterValue = inputValue * cmToMeter;
            break;
          case 'Hectometer':
            meterValue = inputValue * hmToMeter;
            break;
          case 'Decameter':
            meterValue = inputValue * damToMeter;
            break;
          case 'Decimeter':
            meterValue = inputValue * dmToMeter;
            break;
          case 'Millimeter':
            meterValue = inputValue * mmToMeter;
            break;
          default:
            meterValue = inputValue;
            break;
        }
      }

      switch (convert_unit) {
        case 'Meter':
          convertedValue = meterValue;
          break;
        case 'Kilometer':
          convertedValue = meterValue / kmToMeter;
          break;
        case 'Centimeter':
          convertedValue = meterValue / cmToMeter;
          break;
        case 'Hectometer':
          convertedValue = meterValue / hmToMeter;
          break;
        case 'Decameter':
          convertedValue = meterValue / damToMeter;
          break;
        case 'Decimeter':
          convertedValue = meterValue / dmToMeter;
          break;
        case 'Millimeter':
          convertedValue = meterValue / mmToMeter;
          break;
        default:
          convertedValue = meterValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur de longueur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selected_unit,
              items: [
                'Meter',
                'Kilometer',
                'Centimeter',
                'Hectometer',
                'Decameter',
                'Decimeter',
                'Millimeter',
              ].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selected_unit = newValue;
                  });
                }
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: convert_unit,
              items: [
                'Meter',
                'Kilometer',
                'Centimeter',
                'Hectometer',
                'Decameter',
                'Decimeter',
                'Millimeter',
              ].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    convert_unit = newValue;
                  });
                }
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Entrer la valeur à convertir',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 20),
            Text('Résultat: $convertedValue $convert_unit'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LongueurScreen(),
  ));
}
