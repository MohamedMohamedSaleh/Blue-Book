import 'package:blue_book/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: isLoading ? Colors.blue[800] : myPrimaryColor,
            splashFactory: InkRipple.splashFactory,
            fixedSize: const Size(double.infinity, 52),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onPressed,
          child: isLoading
              ? const SizedBox(
                  width: 90,
                  height: 5,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    // color: Colors.blue[800],
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
