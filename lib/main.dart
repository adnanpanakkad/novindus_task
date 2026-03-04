import 'package:flutter/material.dart';
import 'package:novindus_task/controller/api_controller.dart';
import 'package:novindus_task/controller/auth_wrapper.dart';
import 'package:novindus_task/controller/login_controller.dart';
import 'package:novindus_task/controller/register_controller.dart';
import 'package:novindus_task/screens/home_screen.dart';
import 'package:novindus_task/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => ApiController()),
        ChangeNotifierProvider(create: (context) => RegisterController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
