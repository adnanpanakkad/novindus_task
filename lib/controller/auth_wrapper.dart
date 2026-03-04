import 'package:flutter/material.dart';
import 'package:novindus_task/screens/login_screen.dart';
import 'package:novindus_task/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getToken(),
      builder: (context, snapshot) {
        // Still loading token
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If token exists and is not empty → go to Home
        if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
          return const HomeScreen();
        }

        // No valid token → go to Login
        return const LoginScreen();
      },
    );
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}