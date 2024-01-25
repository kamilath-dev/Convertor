import 'package:flutter/material.dart';

class PoidsScreen extends StatefulWidget {
  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<PoidsScreen> {
  String selected_unit = 'Gram';
  String convert_unit = 'Gram';
  double inputValue = 0;
  double convertedValue = 0;

  // Ratios de conversion constants
  static const double tonneToGram = 1e6;
  static const double quintalToGram = 1e5;
  static const double kilogramToGram = 1e3;
  static const double quintalToKilogram = 1e2;
  static const double kilogramToHectogram = 1e1;
  static const double gramToMilligram = 1e3;

  void convert() {
    setState(() {
      double gramValue;

      if (selected_unit == 'Gram') {
        gramValue = inputValue;
      } else {
        switch (selected_unit) {
          case 'Tonne':
            gramValue = inputValue * tonneToGram;
            break;
          case 'Quintal':
            gramValue = inputValue * quintalToGram;
            break;
          case 'Kilogram':
            gramValue = inputValue * kilogramToGram;
            break;
          case 'Quintal (kg)':
            gramValue = inputValue * quintalToKilogram;
            break;
          case 'Kilogram (kg)':
            gramValue = inputValue * kilogramToHectogram;
            break;
          case 'Milligram':
            gramValue = inputValue / gramToMilligram;
            break;
          default:
            gramValue = inputValue;
            break;
        }
      }

      switch (convert_unit) {
        case 'Gram':
          convertedValue = gramValue;
          break;
        case 'Tonne':
          convertedValue = gramValue / tonneToGram;
          break;
        case 'Quintal':
          convertedValue = gramValue / quintalToGram;
          break;
        case 'Kilogram':
          convertedValue = gramValue / kilogramToGram;
          break;
        case 'Quintal (kg)':
          convertedValue = gramValue / quintalToKilogram;
          break;
        case 'Kilogram (kg)':
          convertedValue = gramValue / kilogramToHectogram;
          break;
        case 'Milligram':
          convertedValue = gramValue * gramToMilligram;
          break;
        default:
          convertedValue = gramValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur de masse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selected_unit,
              items: [
                'Gram',
                'Tonne',
                'Quintal',
                'Kilogram',
                'Quintal (kg)',
                'Kilogram (kg)',
                'Milligram',
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
                'Gram',
                'Tonne',
                'Quintal',
                'Kilogram',
                'Quintal (kg)',
                'Kilogram (kg)',
                'Milligram',
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
    home: PoidsScreen(),
  ));
}
