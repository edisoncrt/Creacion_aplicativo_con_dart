import 'package:flutter_application_1/src/feature/screens/Bmi_screen.dart';
import 'package:flutter_application_1/src/feature/screens/Zodiac_screen.dart';
import 'package:flutter_application_1/src/feature/screens/age_screen.dart';
import 'package:flutter_application_1/src/feature/screens/home_screens.dart';
import 'package:flutter_application_1/src/feature/screens/promedio_miAplicacion.dart';
import 'package:go_router/go_router.dart';

class myApplicationAppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/bmi', builder: (context, state) => BmiScreen()),
    GoRoute(path: '/age', builder: (context, state) => AgeScreen()),
    GoRoute(path: '/zodiac', builder: (context, state) => ZodiacScreen()),
    GoRoute(path: '/average', builder: (context, state) => AverageCalculator()),
  ]);
}
