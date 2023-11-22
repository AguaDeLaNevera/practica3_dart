import 'package:flutter/material.dart';
import 'package:movies_app/providers/cocktails_provider.dart';
import 'package:movies_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

// Classe principal que estableix el proveïdor d'estat i inicia l'aplicació
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proveïdor de ChangeNotifier per gestionar l'estat dels còctels
        ChangeNotifierProvider(
          create: (_) => CocktailsProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

// Classe principal de l'aplicació Flutter
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Begudes',
      initialRoute: 'home',
      routes: {
        // Rutes de l'aplicació
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailsScreen(),
      },
      // Tema de l'aplicació amb barra d'aplicació de color indigo
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
