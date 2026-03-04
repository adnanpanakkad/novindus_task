import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController treatmentController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController advanceAmountController = TextEditingController();
  TextEditingController balanceAmountController = TextEditingController();
  TextEditingController starttimeController = TextEditingController();
  TextEditingController endtimeController = TextEditingController();
  final registerFormkey = GlobalKey<FormState>();

  var selectedStartTime = TimeOfDay.now();
  var selectedEndTime = TimeOfDay.now();

  void pickStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );
    if (picked != null && picked != selectedStartTime) {
      selectedStartTime = picked;
      starttimeController.text = picked.format(context);
    }
  }

  void pickEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );
    if (picked != null && picked != selectedEndTime) {
      selectedEndTime = picked;
      endtimeController.text = picked.format(context);
    }
  }

  textFieldValidation(String value) {
    if (value.isEmpty) {
      return "Fill the field";
    } else {
      return null;
    }
  }
}