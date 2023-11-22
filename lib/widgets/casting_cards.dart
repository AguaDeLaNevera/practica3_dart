import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/cocktails_provider.dart';
import 'package:provider/provider.dart';

// Widget que mostra una llista horitzontal de cartes amb recomanacions de begudes per a una pel·lícula
class CastingCards extends StatelessWidget {
  final int id;

  const CastingCards(this.id);

  @override
  Widget build(BuildContext context) {
    // Obtenim l'instància del proveïdor de begudes mitjançant Provider
    final cocktailsProvider =
        Provider.of<CocktailsProvider>(context, listen: false);

    // Utilitzem un FutureBuilder per gestionar la càrrega de les recomanacions de begudes
    return FutureBuilder(
      future: cocktailsProvider.getOnDisplayedRecommendations(id),
      builder: (BuildContext context, AsyncSnapshot<List<Drink>> snapshot) {
        if (!snapshot.hasData) {
          // Mostra un indicador de càrrega si les dades encara no estan disponibles
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          // Si les dades estan disponibles, mostrem la llista horitzontal de cartes
          final casting = snapshot.data!;
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 280,
            child: ListView.builder(
              itemCount: casting.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  _CastCard(casting: casting[index]),
            ),
          );
        }
      },
    );
  }
}

// Widget que representa una carta individual de beguda en la llista horitzontal
class _CastCard extends StatelessWidget {
  final Drink casting;

  // Constructor que rep la beguda com a paràmetre
  const _CastCard({Key? key, required this.casting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: ListView(
        children: [
          Column(
            children: [
              // Imatge de la beguda amb efecte de desvaniment
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(casting.strDrinkThumb),
                  height: 140,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              // Nom de la beguda amb restricció de línies i efecte d'ellipse
              Text(
                casting.strDrink,
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
