import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/widgets/my_health_app_drawer.dart';
import 'package:go_router/go_router.dart';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate;
  int? _age;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _age = _calculateAge(pickedDate);
      });
    });
  }

  int _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(
        title: Text("Age Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Age Screen",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text("Pick your birth date"),
            ),
            if (_selectedDate != null)
              Text(
                "Your age is: $_age",
                style: TextStyle(fontSize: 20),
              ),
            ElevatedButton(
              onPressed: () {
                context.go("/BMI");
              },
              child: Text("Go from Age to Bmi Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
