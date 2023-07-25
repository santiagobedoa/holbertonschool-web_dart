import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    var userData = await fetchUserData();
    var username = json.decode(userData)['username'];
    return 'Hello $username';
  } catch (err) {
    return 'error caught: $err';
  }
}

Future<String> loginUser() async {
  try {
    if (await checkCredentials()) {
      var userExists = true;
      print('There is a user: $userExists');
      return await greetUser();
    } else {
      print('There is a user: false');
      return 'Wrong credentials';
    }
  } catch (err) {
    return 'error caught: $err';
  }
}

