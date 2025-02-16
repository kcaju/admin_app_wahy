import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      required this.controller,
      this.isDescription = false});
  final String hintText;
  final bool isPassword;
  final bool isDescription;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade200)),
      child: TextFormField(
        maxLines: isDescription ? 2 : 1,
        validator: isPassword
            ? (value) {
                if (value != null && value.length >= 6) {
                  return null;
                } else {
                  return "enter password with atleast 8 charaters";
                }
              }
            : (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return "You must fill the field";
                }
              },
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
