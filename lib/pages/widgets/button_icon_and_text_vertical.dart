import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonIconAndTextVertical extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onClick;

  const ButtonIconAndTextVertical({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          Text(text, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
