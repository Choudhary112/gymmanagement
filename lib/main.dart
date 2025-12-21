import 'package:flutter/material.dart';
import 'package:gymmanagement/Core/Colors.dart';
import 'package:gymmanagement/Provider/Member_provider.dart';
import 'package:gymmanagement/SplashScren/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MemberProvider>(create: (_) => MemberProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Energie Gym',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.primary,
      ),
      home: const SplashScreen(),
    );
  }
}
