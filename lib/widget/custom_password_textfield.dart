import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextfield extends StatefulWidget {
  // Reusable widget
  final Color? color;
  final String hintText;
  final String imageUrl;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  const CustomPasswordTextfield({
    Key? key,
    required this.hintText,
    required this.imageUrl,
    this.onChanged,
    this.validator,
    this.color,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: _isObscure,
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
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    widget.imageUrl,
                    width: 24,
                    color: widget.color,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
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
