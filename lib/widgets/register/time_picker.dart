import 'package:flutter/material.dart';
import 'package:novindus_task/controller/register_controller.dart';
import 'package:novindus_task/utils/appcolors.dart';
import 'package:provider/provider.dart';

class TimeSlotPiker extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator? validation;
  final Function? onTap;

  const TimeSlotPiker({
    super.key,
    this.controller,
    this.hintText,
    this.validation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final registerController = Provider.of<RegisterController>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        readOnly: true,
        controller: controller,
        validator: validation,
        onTap: () => onTap!(),
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Appcolor.buttonColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}