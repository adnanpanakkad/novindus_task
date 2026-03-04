import 'package:flutter/material.dart';
import 'package:novindus_task/utils/app_textstyles.dart';
import 'package:novindus_task/utils/appcolors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.hintText,
    this.validation,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly,
    this.onChanged,
    FocusNode? focusNode,
    required this.labelText,
  });

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? hintText;
  final FormFieldValidator? validation;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: CustomTextStyle.textFieldlabelstyle),
          const SizedBox(height: 8.0),

          // TextFormField
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            validator: validation,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: const EdgeInsets.all(20),
              hintText: hintText,
              hintStyle: CustomTextStyle.textFieldstyle,
              fillColor: const Color.fromARGB(255, 237, 237, 237),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 210, 210, 210),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Appcolor.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}