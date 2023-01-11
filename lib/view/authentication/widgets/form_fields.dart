import 'package:flutter/material.dart';
import 'package:movie_details/helpers/refactoring.dart';

class Fields extends StatelessWidget {
  const Fields(
      {Key? key,
      required this.error,
      required this.label,
      required this.controller,
      required this.iconData, required this.keybord})
      : super(key: key);

  final String error;
  final String label;
  final TextEditingController controller;
  final IconData iconData;
  final TextInputType keybord;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keybord,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return error;
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          focusColor: lightGreen,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: lightGreen, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
