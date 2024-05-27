import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

class BmiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double? _bmi;

  void _calculateBMI() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height != null && weight != null && height > 0) {
      setState(() {
        _bmi = weight / (height * height);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (registro en metros)',
              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (registro en kilogramos)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            if (_bmi != null)
              Text(
                'Your BMI is ${_bmi!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ElevatedButton(
              onPressed: () {
                context.go('/zodiac');
              },
              child: Text('Go from BMI to Zodiac Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
