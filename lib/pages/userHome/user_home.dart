import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/user.dart';

class UserHomePage extends StatelessWidget {
  static const String keyRoute = "UserHomePage";
  final User user;

  const UserHomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Welcome ${user.name}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
