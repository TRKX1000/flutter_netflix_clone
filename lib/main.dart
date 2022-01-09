import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/di/locator.dart';
import 'package:flutter_netflix_clone/router/app_router.dart';

import 'data/user.dart';
import 'pages/userHome/user_home.dart';
import 'pages/userSelection/user_selection_page.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  User? userSelected;
  final _navigatorKey = GlobalKey<NavigatorState>();//define a navigation key.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: ThemeData(fontFamily: 'Netflix Sans'),
      onGenerateRoute: (_) => null,
      builder: (context, child){
        return Navigator(
          key: _navigatorKey,
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
      },
    );
  }
}
