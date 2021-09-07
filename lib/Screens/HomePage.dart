
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text('Preview'),
        ),
        drawer: Container(
          width: size.width * 0.63,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(

                  ),
                  child: Card(
                    elevation: 20,
                    child: Center(
                      child: Text(
                        'Avatar',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Card(elevation: 10,
                  child: ListTile(
                    leading: Icon(Icons.mood_rounded),
                    title: Text('Theme'),
                    
                    onTap: () => Navigator.of(context).pushNamed('/ThemeScreen')
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
