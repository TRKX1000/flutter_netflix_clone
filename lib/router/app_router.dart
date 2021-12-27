import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/user_home.dart';
import 'package:flutter_netflix_clone/pages/userSelection/user_selection_page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  final navigatorKey = GlobalKey<NavigatorState>();
  User? userSelected;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey(UserSelectionPage.keyRoute),
          child: UserSelectionPage(
            onUserClick: (user) {
              setState(() {
                userSelected = user;
              });
            },
          ),
        ),
        if (userSelected != null)
          MaterialPage(
              key: const ValueKey(UserHomePage.keyRoute),
              child: UserHomePage(
                user: userSelected!,
              ))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        userSelected = null;

        return true;
      },
    );
  }
}
