import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ZodiacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zodiac Sign Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ZodiacSignCalculatorPage(),
    );
  }
}

class ZodiacSignCalculatorPage extends StatefulWidget {
  @override
  _ZodiacSignCalculatorPageState createState() =>
      _ZodiacSignCalculatorPageState();
}

class _ZodiacSignCalculatorPageState extends State<ZodiacSignCalculatorPage> {
  final _dateController = TextEditingController();
  String? _zodiacSign;

  void _calculateZodiacSign() {
    final inputDate = DateTime.tryParse(_dateController.text);
    if (inputDate != null) {
      setState(() {
        _zodiacSign = _getZodiacSign(inputDate);
      });
    }
  }

  String _getZodiacSign(DateTime date) {
    final month = date.month;
    final day = date.day;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return 'Acuario';
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return 'Piscis';
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return 'Aries';
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return 'Tauro';
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return 'Géminis';
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return 'Cáncer';
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return 'Leo';
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return 'Virgo';
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return 'Libra';
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return 'Escorpio';
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return 'Sagitario';
    } else {
      return 'Capricornio';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zodiac Sign Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Date of Birth (AAAA-MM-DD)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateZodiacSign,
              child: Text('Calculate Zodiac Sign'),
            ),
            SizedBox(height: 20),
            if (_zodiacSign != null)
              Text(
                'Your Zodiac Sign is $_zodiacSign',
                style: TextStyle(fontSize: 24),
              ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Go from zodiac to home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
