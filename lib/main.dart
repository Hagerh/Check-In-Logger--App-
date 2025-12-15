import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/business/cubit/email/email_auth_cubit.dart';

import 'package:flutter_application_1/business/cubit/location/location_cubit.dart';
import 'package:flutter_application_1/business/cubit/checkIn/checkin_cubit.dart'; // Ensure casing matches your folder
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EmailAuthCubit()),
        BlocProvider(create: (_) => LocationCubit()),
        BlocProvider(create: (_) => CheckInCubit()),
      ],
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        title: 'Check-In App',
        theme: ThemeData.light(), // Fixed theme since sensor is removed
        initialRoute: '/',
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}