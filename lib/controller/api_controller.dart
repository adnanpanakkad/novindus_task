import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:novindus_task/models/patient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiController with ChangeNotifier {
  Future<String?> loginUser({
    required String userName,
    required String password,
  }) async {
    try {
      final body = {'username': userName, 'password': password};
      const url = "https://flutter-amr.noviindus.in/api/Login";
      final uri = Uri.parse(url);
      final response = await http.post(uri, body: body);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final String? token = jsonData['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token!);
        log(jsonData.toString());
        log(token.toString());
    
        return token;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<PatientModel>> fetchPatientList() async {
    const url = "https://flutter-amr.noviindus.in/api/PatientList";
    final sharedprf = await SharedPreferences.getInstance();
    String? token = sharedprf.getString('token');

    print(token);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('7777777777777777777777777777777777777777777');
        final jsonData = jsonDecode(response.body);
        final List<dynamic> patients = jsonData['patient'];

        return patients.map((patient) {
          // Check if patientdetails_set is not empty
          final patientDetails =
              (patient['patientdetails_set'] as List).isNotEmpty
              ? patient['patientdetails_set'][0]
              : null;

          return PatientModel(
            name: patient['name'] ?? 'Unknown',
            date: patient['created_at'] ?? '',
            treatment: patientDetails?['treatment_name'] ?? 'No treatment',
            user: patient['user'] ?? 'No treatment',
          );
        }).toList();
      } else {
        log("Failed to fetch data. Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      log("Error fetching data: $e");
      return [];
    }
  }
}
