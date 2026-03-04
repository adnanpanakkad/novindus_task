import 'package:flutter/material.dart';
import 'package:novindus_task/screens/home_screen.dart';
import 'package:provider/provider.dart'; // ← add this
import 'package:novindus_task/controller/api_controller.dart';

class LoginController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    // Optional: add better email validation if needed
    // if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
    //   return 'Enter a valid email';
    // }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  Future<void> submitLogin(BuildContext context) async {
    if (isLoading) return;

    final form = loginFormKey.currentState;
    if (form == null || !form.validate()) return;

    isLoading = true;
    notifyListeners();

    // Get ApiController using Provider
    final apiController = Provider.of<ApiController>(context, listen: false);

    try {
      final token = await apiController.loginUser(
        userName: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (token != null && token.isNotEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login successful')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        // TODO: save token
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', token);

        // TODO: navigate to next screen
        // Navigator.pushReplacementNamed(context, '/home');

        resetTextFields();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed - no token received')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
