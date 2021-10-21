import 'package:flutter/material.dart';
import 'package:preview/Providers/Album_Provider.dart';
import 'package:preview/Providers/Theme_Provider.dart';
import 'package:preview/Providers/auth_Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Routes.dart/route_gen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Preview(),
    ),
  );
}

class Preview extends StatelessWidget {
  const Preview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      // MaterialApp());
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '?',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: themeProvider.darkTheme ? ThemeData.dark() : ThemeData.light(),
      );
    });
  }
}
