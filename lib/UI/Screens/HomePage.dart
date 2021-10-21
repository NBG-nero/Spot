import 'package:flutter/material.dart';
import 'package:preview/UI/Screens/AlbumPage.dart';
// import 'package:preview/services/auth_service.dart';
import 'package:preview/Providers/auth_Provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Preview'),
            ),
            drawer: Container(
              width: size.width * 0.63,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.all(8),
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(),
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
                    Card(
                      elevation: 10,
                      child: ListTile(
                          leading: Icon(Icons.mood_rounded),
                          title: Text('Theme'),
                          onTap: () =>
                              Navigator.of(context).pushNamed('/ThemeScreen')),
                    ),
                    Card(
                      elevation: 10,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('logout'),
                        onTap: () async {
                          authProvider.logout(context);

                          // await AuthService().signOut();
                          // if (AuthService().getCurrentUid == null) {
                          //   Navigator.of(context).pushNamed('/login');
                          // } else {
                          //   Navigator.of(context).pushNamed('/');
                          // }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: AlbumPage()),
      );
    });
  }
}
