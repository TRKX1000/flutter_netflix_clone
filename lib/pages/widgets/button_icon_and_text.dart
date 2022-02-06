import 'package:flutter/material.dart';

class ButtonIconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onClick;

  const ButtonIconAndText({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white60;
          } else {
            return Colors.white; // Use the component's default.
          }
        },
      )),
      onPressed: () {
        onClick();
      },
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black),
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
