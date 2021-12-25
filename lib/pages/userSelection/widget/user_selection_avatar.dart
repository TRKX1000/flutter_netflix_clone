import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/user.dart';

class UserSelectionAvatar extends StatelessWidget {
  final User user;

  const UserSelectionAvatar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                user.avatarImage,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
