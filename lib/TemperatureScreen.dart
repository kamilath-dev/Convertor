import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  String selected_unit = 'Celsius';
  String convert_unit = 'Celsius';
  double inputValue = 0;
  double convertedValue = 0;

  // Ratios de conversion constants
  static const double celsiusToFahrenheit = 33.8;
  static const double celsiusToKelvin = 274.15;

  void convert() {
    setState(() {
      double celsiusValue;

      if (selected_unit == 'Celsius') {
        celsiusValue = inputValue;
      } else {
        switch (selected_unit) {
          case 'Fahrenheit':
            celsiusValue = (inputValue - celsiusToFahrenheit) * (5 / 9);
            break;
          case 'Kelvin':
            celsiusValue = inputValue - celsiusToKelvin;
            break;
          default:
            celsiusValue = inputValue;
            break;
        }
      }

      switch (convert_unit) {
        case 'Celsius':
          convertedValue = celsiusValue;
          break;
        case 'Fahrenheit':
          convertedValue = celsiusValue * (9 / 5) + celsiusToFahrenheit;
          break;
        case 'Kelvin':
          convertedValue = celsiusValue + celsiusToKelvin;
          break;
        default:
          convertedValue = celsiusValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur de Temperature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selected_unit,
              items: [
                'Celsius',
                'Fahrenheit',
                'Kelvin',
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
                'Celsius',
                'Fahrenheit',
                'Kelvin',
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
    home: TemperatureScreen(),
  ));
}
