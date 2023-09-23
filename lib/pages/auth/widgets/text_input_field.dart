import 'package:flutter/material.dart';

typedef ValueCallback = void Function(String? value);

class TextInputField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final VoidCallback? showPassword;
  final ValueCallback? onChange;
  final bool obscureText;
  final bool requiredField;
  const TextInputField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.showPassword,
    this.obscureText = false,
    this.onChange,
    this.requiredField = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChange,
      validator: (value) =>
          (value != null && value.isNotEmpty) ? null : 'Required Field',
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(color: Colors.blueGrey),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: (prefixIcon == null) ? null : Icon(prefixIcon),
        suffixIcon: (suffixIcon == null)
            ? null
            : IconButton(
                onPressed: showPassword,
                icon: Icon(suffixIcon),
              ),
        label: Text(label),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintStyle: const TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
