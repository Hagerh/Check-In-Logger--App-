import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentaion/screens/addcheckin_screen.dart';
import 'package:flutter_application_1/Presentaion/screens/checkin_screen.dart';
import 'package:flutter_application_1/Presentaion/screens/signin_screen.dart';
import 'package:flutter_application_1/Presentaion/screens/singup_screen.dart';

import 'package:flutter_application_1/Presentaion/screens/details_screen.dart'; 


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
 
      case '/checkin_list': 
        return MaterialPageRoute(builder: (context) => const CheckInListScreen());

      case '/add_checkin':
        return MaterialPageRoute(builder: (context) => const AddCheckInScreen());

      case '/details':
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (context) => DetailsScreen(data: data));

      case '/signin':
        return MaterialPageRoute(builder: (_) => SigninScreen());
      
      default:
       
        return MaterialPageRoute(builder: (_) => const SignupScreen());
    }
  }
}