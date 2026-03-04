class UserRegisterModel {
  final String name;
  final String whatsnumber;
  final String address;
  final String location;
  final String branch;
  final String treatments;
  final String totalamount;
  final String discountamount;
  final String paymentoption;
  final String advanceamount;
  final String balanceamount;
  final String treatmenttime;

  // Constructor
  UserRegisterModel({
    required this.name,
    required this.whatsnumber,
    required this.address,
    required this.location,
    required this.branch,
    required this.treatments,
    required this.totalamount,
    required this.discountamount,
    required this.paymentoption,
    required this.advanceamount,
    required this.balanceamount,
    required this.treatmenttime,
  });

  // Convert JSON to UserRegisterModel
  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      name: json['name'] as String,
      whatsnumber: json['whatsnumber'] as String,
      address: json['address'] as String,
      location: json['location'] as String,
      branch: json['branch'] as String,
      treatments: json['treatments'] as String,
      totalamount: json['totalamount'] as String,
      discountamount: json['discountamount'] as String,
      paymentoption: json['paymentoption'] as String,
      advanceamount: json['advanceamount'] as String,
      balanceamount: json['balanceamount'] as String,
      treatmenttime: json['treatmenttime'] as String,
    );
  }

  // Convert UserRegisterModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'whatsnumber': whatsnumber,
      'address': address,
      'location': location,
      'branch': branch,
      'treatments': treatments,
      'totalamount': totalamount,
      'discountamount': discountamount,
      'paymentoption': paymentoption,
      'advanceamount': advanceamount,
      'balanceamount': balanceamount,
      'treatmenttime': treatmenttime,
    };
  }
}