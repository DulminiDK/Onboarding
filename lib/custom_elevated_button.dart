import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.title,
    required this.process,
    super.key,
    required this.screenWidth,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
  });

  final double screenWidth;
  final String? title;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;
  final void Function()? process;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(
        horizontal: 28.0,
        vertical: 8.0,
      ),
      child: ElevatedButton(
        onPressed: process,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return activeColor;
              }
              return inactiveColor;
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
