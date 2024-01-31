import 'package:flutter/material.dart';

class DosageForm extends StatelessWidget {

  final TextEditingController controller;

  const DosageForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.number,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        // labelText: "name",
        // labelStyle: TextStyle(fontSize: 17, color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black54,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
