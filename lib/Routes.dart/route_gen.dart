import 'package:flutter/material.dart';
import 'package:preview/UI/Screens/AlbumPage.dart';
import 'package:preview/UI/Screens/HomePage.dart';
import 'package:preview/UI/Screens/ThemeScreen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
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
  static Route<dynamic> _errorRoute(){
    
  return MaterialPageRoute(builder: (_) {
  return Scaffold (
  appBar:AppBar(
  title:Text('Error'),
  ),
  body:Center(child:Text("ERROR"),
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
