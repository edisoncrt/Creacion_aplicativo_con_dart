import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/widgets/my_health_app_drawer.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyHealthAppDrawer(),
        appBar: AppBar(
          title: Text('HOLA !              Bienvenido '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.push('/age'),
                child: Text('Calculate Age'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/Bmi'),
                child: Text('Calculate Bmi'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 91, 101, 194),
                  foregroundColor: Color.fromARGB(255, 144, 179, 18),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/zodiac'),
                child: Text('Calculate zodiac '),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lime,
                  foregroundColor: Color.fromARGB(255, 184, 157, 163),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/average'),
                child: Text('Calculate average '),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 243, 94, 8),
                  foregroundColor: Color.fromARGB(235, 110, 136, 209),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/zodiac');
                },
                child: Text('Go from home to zodiac Screen'),
              ),
            ],
          ),
        ));
  }
}
