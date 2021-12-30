import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/user.dart';

class UserSelectionAvatar extends StatelessWidget {
  final User user;

  final void Function(User user) onUserClick;

  const UserSelectionAvatar(
      {Key? key,
      required this.user,
      required Function(User user) this.onUserClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onUserClick(user),
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                user.avatarImage,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
