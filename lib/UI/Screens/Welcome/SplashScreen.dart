import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  // bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation.addListener(() => this.setState(() {}));
    _controller.forward();

    Timer(Duration(seconds: 4), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isLoggedIn', isLoggedIn);
      bool isLoggedIn = prefs.getBool('isLoggedIn');
    
      // if (isLoggedIn == true) {
      //   Navigator.of(context)
      //       .pushNamedAndRemoveUntil('/', (route) => route == null);
      // } else {
      //   Navigator.of(context)
      //       .pushNamedAndRemoveUntil('login', (route) => route == null);
      // }
      isLoggedIn == true
          ? Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false)
          : Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);

      // bool isSignedUp = prefs.getBool('isSignedUp');
      // isSignedUp
      // ? Navigator.of(context).pushNamed('login')
      //     : Navigator.of(context).pushNamed('signUp');
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.cyan[900],
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromRGBO(50, 250, 210, 1),
                  Color.fromRGBO(0, 0, 255, 1)
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.cyan,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Loading....',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  // void setIsloggedIn(value) {
  //   isLoggedIn = value;
  // }
}
