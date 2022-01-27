import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  // Reusable widget
  final Color? color;
  final String hintText;
  final String imageUrl;
  final Widget? prefix;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.imageUrl,
    this.onChanged,
    this.validator,
    this.prefix,
    this.color,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: widget.obscureText,
              controller: widget.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    widget.imageUrl,
                    width: 24,
                    color: widget.color,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: widget.hintText,
                hintStyle: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                ),
              ),
              validator: widget.validator,
            ),
          )
        ],
      ),
    );
  }
}
