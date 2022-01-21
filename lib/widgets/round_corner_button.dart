import 'package:flutter/material.dart';

class RoundCornerButton extends StatelessWidget {
  const RoundCornerButton({
    Key? key,
    required this.text,
    required this.color,
    required this.borderColor,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color borderColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        shadowColor: MaterialStateProperty.all(color),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: borderColor, width: 1)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
