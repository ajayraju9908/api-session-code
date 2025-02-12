import 'package:assigned_task/provider/login_provider.dart';
import 'package:assigned_task/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => LoginProvider() )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
