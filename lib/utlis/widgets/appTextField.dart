import 'package:flutter/material.dart';

Widget appTextField(
    {required String? Function(String?)? valid,
    required IconData iconData,
    TextEditingController? controller,
    required String label,
    required String hint,
    void Function(String value)? func}) {
  return TextFormField(
    controller: controller,
    validator: valid,
    onChanged: func,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        hoverColor: Colors.black,
        prefixIcon: Icon(iconData),
        label: Text(label),
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(20)))),
  );
}
