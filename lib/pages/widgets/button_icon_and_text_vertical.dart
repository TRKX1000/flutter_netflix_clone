import 'package:flutter/material.dart';

class ButtonIconAndTextVertical extends StatelessWidget {
  final IconData icon;
  final String text;

  const ButtonIconAndTextVertical({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.grey))
      ],
    );
  }
}
