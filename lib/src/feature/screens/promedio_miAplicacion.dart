import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AverageCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Average Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AverageCalculatorPage(),
      },
    );
  }
}

class AverageCalculatorPage extends StatefulWidget {
  @override
  _AverageCalculatorPageState createState() => _AverageCalculatorPageState();
}

class _AverageCalculatorPageState extends State<AverageCalculatorPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  double? _average;

  void _calculateAverage() {
    final num1 = double.tryParse(_controller1.text);
    final num2 = double.tryParse(_controller2.text);
    final num3 = double.tryParse(_controller3.text);
    final num4 = double.tryParse(_controller4.text);

    if (num1 != null && num2 != null && num3 != null && num4 != null) {
      setState(() {
        _average = (num1 + num2 + num3 + num4) / 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Average Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
              ),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
              ),
            ),
            TextField(
              controller: _controller3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 3',
              ),
            ),
            TextField(
              controller: _controller4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 4',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAverage,
              child: Text('Calculate Average'),
            ),
            SizedBox(height: 20),
            if (_average != null)
              Text(
                'The average is ${_average!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ElevatedButton(
              onPressed: () {
                context.go('/home');
              },
              child: Text('Go from average to home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
