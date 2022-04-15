
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoggedRepository{

  static const _sharedPreferencesKeyUserName = "KEY_USER_NAME";
  static const _sharedPreferencesKeyUserAvatar = "KEY_USER_AVATAR";

  Future<void> saverUser(User user)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPreferencesKeyUserName, user.name);
    await prefs.setString(_sharedPreferencesKeyUserAvatar, user.avatarImage);
  }

  Future<User> getUser()async{
    final prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString(_sharedPreferencesKeyUserName)?? "";
    String avatarImage = prefs.getString(_sharedPreferencesKeyUserAvatar)?? "";
    return User(avatarImage: avatarImage, name: userName);
  }

  Future<void> deleteUser()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sharedPreferencesKeyUserName);
    await prefs.remove(_sharedPreferencesKeyUserAvatar);
  }

}