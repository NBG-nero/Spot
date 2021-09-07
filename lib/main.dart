import 'package:flutter/material.dart';
import 'package:preview/Providers/Theme_Provider.dart';
import 'package:provider/provider.dart';
import 'Routes.dart/route_gen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(ThemeData.light()),
        ),
      ],
      child: Preview(),
    ));


class Preview extends StatelessWidget {
  const Preview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      // MaterialApp());
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: theme.getTheme(),
      );

    });
  }
}
