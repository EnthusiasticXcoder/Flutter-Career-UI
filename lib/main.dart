import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/constants.dart';

import 'app.dart';
import 'services/django_api_service.dart';
import 'bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLanguage.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: AppConstants.appFont,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
        ),
      ),
      home: BlocProvider(
        create: (context) => MainBloc(DjangoAPIservice.fromBackend()),
        child: const HomePage(),
      ),
    );
  }
}
