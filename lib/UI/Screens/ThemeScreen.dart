import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preview/Providers/Theme_Provider.dart';


class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key key}) : super(key: key);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    // ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    
return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {



  return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('THEME'),
      ),
      body: Container(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            MaterialButton(child:Text('Dark Theme'),
            elevation: 10,
            color: Colors.grey,
            onPressed: ()=> themeProvider.toggleTheme(true)
            ),

            SizedBox(height:10),
            
            MaterialButton(child:Text('Light Theme'),
            elevation: 10,
            color: Colors.grey,
            onPressed: ()=>  themeProvider.toggleTheme(false)
            ),
          ],),
        )
      ),
    );


    });



       

  
  }
}
