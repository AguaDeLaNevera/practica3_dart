import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/cocktails_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cocktailsProvider = Provider.of<CocktailsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(drinks: cocktailsProvider.onDisplayCocktail),
              MovieSlider(drinks: cocktailsProvider.onDisplayNoAlcohol),
              // Slider de pel·licules
              //MovieSlider(movies: cocktailsProvider.onPopular),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              // MovieSlider(),
              // MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
