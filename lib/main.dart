import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(const BeautyAssistantApp());
}

/// Main application widget for Beauty Assistant
class BeautyAssistantApp extends StatelessWidget {
  const BeautyAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Assistant',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: BlocProvider(
        create: (context) => HomeModule.provideHomeBloc(),
        child: const HomePage(),
      ),
    );
  }
}