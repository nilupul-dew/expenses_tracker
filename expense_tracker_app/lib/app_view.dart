import 'package:flutter/material.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          //added surface instead of background since background is depreciated
          surface: Colors.grey.shade100,
          onSurface:Colors.black,
          primary:const Color(0xff00e2b7),
          secondary: const Color(0xffe064f7),
          tertiary: const Color(0xffff8d6c)

        )
      ),
      home: const HomeScreen(),
    );
  }
}