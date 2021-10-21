import 'package:flutter/material.dart';
import 'package:preview/UI/Screens/AlbumPage.dart';
import 'package:preview/UI/Screens/Auth/Login.dart';
import 'package:preview/UI/Screens/Auth/SignUp.dart';
import 'package:preview/UI/Screens/HomePage.dart';
import 'package:preview/UI/Screens/ThemeScreen.dart';
import 'package:preview/UI/Screens/Welcome/SplashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '?':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUp());

        case '/login':
        return MaterialPageRoute(builder: (_) => Login());
        
      case '/ThemeScreen':
// if themeScreenpage has a variable of type string,this validates the correct data type
        // if (args is String) {
        //  return MaterialPageRoute(builder:(_) =>ThemeScreen(data: args));
        // }
        return MaterialPageRoute(builder: (_) => ThemeScreen());
      // if args is not of the correct type return ana error Page,
      // you can also throw an exception
      case '/AlbumPage':
        return MaterialPageRoute(builder: (_) => AlbumPage());

        return _errorRoute();
      // return _onBasicAlertPressed(Context);

      default:
        // if there is no such named route in the switch statement, e.g. / third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(backgroundColor: Colors.red,
        // appBar: AppBar(
        //   title: Text('Error'),
        // ),
        body: Center(
          child: Text("ERROR",style: TextStyle(color: Colors.white,fontSize: 40),),
        ),
      );
    });
  }

  // _onBasicAlertPressed(context) {
  //   Alert(
  //     context: context,
  //     title: 'Finished',
  //     desc: 'You\'ve reached the end of the quiz',
  //   ).show();
  // }
}
