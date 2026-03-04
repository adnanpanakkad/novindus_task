import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _selectedValue = 'Cash'; 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<String>(
            title: const Text('Cash'),
            value: 'Cash',
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
            contentPadding: EdgeInsets.zero, 
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: const Text('Card'),
            value: 'Card',
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
            contentPadding: EdgeInsets.zero, 
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: const Text('UPI'),
            value: 'UPI',
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
            contentPadding: EdgeInsets.zero, 
          ),
        ),
      ],
    );
  }
}