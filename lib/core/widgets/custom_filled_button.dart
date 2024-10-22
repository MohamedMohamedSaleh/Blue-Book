import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            splashFactory: InkRipple.splashFactory,
            fixedSize: const Size(double.infinity, 52),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
