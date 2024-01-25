import 'package:flutter/material.dart';

class DevicesScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<DevicesScreen> {
  String selected_unit = 'USD';
  String convert_unit = 'USD';
  double inputValue = 0;
  double convertedValue = 0;

  // Taux de change constants
  static const double eurToUsdRate = 1.08789;
  static const double jpyToUsdRate = 0.00681;
  static const double xofToUsdRate = 0.00166;

  void convert() {
    setState(() {
      // Logique de conversion
      double usdValue;

      if (selected_unit == 'USD') {
        usdValue = inputValue;
      } else {
        switch (selected_unit) {
          case 'EUR':
            usdValue = inputValue * eurToUsdRate;
            break;
          case 'JPY':
            usdValue = inputValue * jpyToUsdRate;
            break;
          case 'XOF':
            usdValue = inputValue * xofToUsdRate;
            break;
          default:
            usdValue = inputValue;
            break;
        }
      }

      switch (convert_unit) {
        case 'USD':
          convertedValue = usdValue;
          break;
        case 'EUR':
          convertedValue = usdValue / eurToUsdRate;
          break;
        case 'JPY':
          convertedValue = usdValue / jpyToUsdRate;
          break;
        case 'XOF':
          convertedValue = usdValue / xofToUsdRate;
          break;
        default:
          convertedValue = usdValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur de device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selected_unit,
              items: ['USD', 'EUR', 'JPY', 'XOF'].map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
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
              items: ['USD', 'EUR', 'JPY', 'XOF'].map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
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
            Text('Résultat: $convertedValue'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DevicesScreen(),
  ));
}
