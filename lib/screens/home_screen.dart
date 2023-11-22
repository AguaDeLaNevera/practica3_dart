import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/cocktails_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

// Pantalla principal que mostra begudes alcohòliques i no alcohòliques
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenim l'instància del proveïdor de begudes mitjançant Provider
    final cocktailsProvider = Provider.of<CocktailsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Funcionalitat del botó de cerca (encara per implementar)
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                "Begudes alcohòliques",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Widget que mostra un carrusel de targetes per a begudes alcohòliques
              CardSwiper(drinks: cocktailsProvider.onDisplayCocktail),
              // Widget que mostra un carrusel de targetes per a begudes no alcohòliques
              MovieSlider(drinks: cocktailsProvider.onDisplayNoAlcohol),
            ],
          ),
        ),
      ),
    );
  }
}
