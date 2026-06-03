import 'package:flutter/material.dart';

class BloodTypeDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;

  const BloodTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bloodTypes = [
      "A+","A-","B+","B-","O+","O-","AB+","AB-"
    ];

    return DropdownButtonFormField<String>(
      value: value,
      items: bloodTypes
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: "Blood Type",
        border: OutlineInputBorder(),
      ),
      validator: (v) => v == null ? "Required" : null,
    );
  }
}