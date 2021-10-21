import 'package:flutter/material.dart';

import 'package:preview/services/Firebase_auth_service.dart';
import 'package:preview/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;
  bool isLoggedIn = false;
  bool autoValidate = false;

  getUserName(username) async {
    username = await AuthService().getCurrentName();
    notifyListeners();
    // return username;
  }

  String _message = '';

  setmessage(msg) {
    _message = msg;
    notifyListeners();
  }

  get message {
    return this._message;
  }

  Future signUp(name, email, password, context) async {
    try {
      print('sign up was called');

      await AuthService()
          .createUserWithEmailAndPassword(
        name,
        email,
        password,
      )
          .then((data) {
        setLoading(true);
        FirebaseService.addUser(name, email);
        print('task successfuly failed');
        setLoading(false);
        Navigator.of(context).pushNamed('/login');
        notifyListeners();
      });
      // await  FirebaseAuth.instance
      //     .createUserWithEmailAndPassword();
    } catch (e) {
      print(e);
      setLoading(false);
    }

    // } else {
    //   print('fields incomplete');
    // }
    // notifyListeners();
  }

  logIn(email, password, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (isValid == true) {
    try {
      print('method was called');
      await AuthService()
          .signInWithEmailAndPassword(email, password)
          .then((val) {
        setLoading(true);
        setIsloggedIn(true);
        prefs.setString('email', email);
        prefs.setBool('isLoggedIn', isLoggedIn);
        print(isLoggedIn.toString());
        print('Task failed successfully');
        Navigator.of(context).pushNamed('/');
        notifyListeners();
      });
      // await FirebaseAuth.instance.signInWithEmailAndPassword();
    } catch (e) {
      print(e.message);
      setmessage(e.message);
      setLoading(false);
      notifyListeners();
    }
    // } else {
    //   print('empty fields');
    // }
    // notifyListeners();
  }

  setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setIsloggedIn(value) {
    isLoggedIn = value;
    notifyListeners();
  }

  // setisSignedOut(value) {
  //   isSignedout = value;
  //   notifyListeners();
  // }

  setAutoValidate(value) {
    autoValidate = value;
    notifyListeners();
  }

  logout(context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await AuthService().signOut();
      // setLoading(true);
      if (await AuthService().getCurrentUser() == null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
