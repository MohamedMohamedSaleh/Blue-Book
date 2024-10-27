import 'package:flutter/material.dart';

class CustomAppInput extends StatefulWidget {
  const CustomAppInput({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.passwordIcon,
    this.controller,
    this.validator,
    this.isFocus = false,
  });

  final bool isFocus;
  final bool isPassword;
  final String labelText;
  final IconData? passwordIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomAppInput> createState() => _CustomAppInputState();
}

class _CustomAppInputState extends State<CustomAppInput> {
  bool isHiden = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 52,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isHiden && widget.isPassword,
        cursorHeight: 15,
        style: const TextStyle(
          fontSize: 15,
        ),
        autofocus: widget.isFocus,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    isHiden
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20,
                    color: const Color(0xff696969),
                  ),
                  onPressed: () {
                    isHiden = !isHiden;
                    setState(() {});
                  },
                )
              : null,
          labelStyle: const TextStyle(fontSize: 14),
          labelText: widget.labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xAA696969)),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff696969)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
