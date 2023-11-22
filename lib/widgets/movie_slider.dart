import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

// Widget que mostra una llista horitzontal de begudes no alcohòliques
class MovieSlider extends StatelessWidget {
  final List<Drink> drinks;

  // Constructor que rep una llista de begudes com a paràmetre
  const MovieSlider({Key? key, required this.drinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenim la mida de la pantalla
    final size = MediaQuery.of(context).size;

    // Si no hi ha begudes, mostrem un indicador de càrrega
    if (this.drinks.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Si hi ha begudes, mostrem la llista horitzontal
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Títol de la secció de begudes no alcohòliques
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              'Begudes no alcohòliques',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          // Llista horitzontal de begudes
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: drinks.length,
              itemBuilder: (_, int index) =>
                  _MoviePoster(beguda: drinks[index]),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget que representa una targeta individual de beguda en la llista horitzontal
class _MoviePoster extends StatelessWidget {
  final Drink beguda;

  // Constructor que rep la beguda com a paràmetre
  const _MoviePoster({Key? key, required this.beguda}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          Column(
            children: [
              // Imatge de la beguda amb efecte de desvaniment
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'details', arguments: beguda),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(beguda.strDrinkThumb),
                    width: 130,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Nom de la beguda amb restricció de línies i efecte d'ellipse
              Text(
                beguda.strDrink,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
