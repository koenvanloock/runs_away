import 'package:flutter/cupertino.dart';

class AuthenticationService {

  static AuthenticationService _instance;
  static User user;

  AuthenticationService() {
  }

  static AuthenticationService getInstance() {
    if(_instance == null) {
      _instance = AuthenticationService();
    }
    return _instance;
  }


  Future<User> login(String username, String password) {
    if(password != 'fout') {
      return Future.sync(() {
        user = User(
            firstname: 'Koen',
            lastname: 'Van Loock',
            age: 31);
        return user;
      });
    } else {
      return Future.error(Error());
    }
  }

}

class User {
  final String firstname;
  final String lastname;
  final int age;

  User({@required this.firstname, @required this.lastname, this.age});
}