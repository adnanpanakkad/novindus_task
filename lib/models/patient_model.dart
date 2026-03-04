class PatientModel {
  final String name;
  final String date; 
  final String treatment;
  final String user;

  PatientModel({
    required this.name,
    required this.date,
    required this.treatment,
    required this.user,
  });

  // Factory constructor to create a Patient object from JSON
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name'] as String,
      date: json['date'] as String,
      treatment: json['treatment'] as String,
      user: json['user'] as String,
    );
  }

  // Method to convert a Patient object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'treatment': treatment,
      'user': user,
    };
  }
  
}