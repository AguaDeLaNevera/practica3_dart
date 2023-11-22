import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/cocktails_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

// Pantalla de detalls per a una beguda específica
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenim la beguda passada com a argument de la ruta
    final Drink drink = ModalRoute.of(context)?.settings.arguments as Drink;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Appbar personalitzada que mostra la imatge de la beguda com a fons
          _CustomAppBar(drink: drink),
          // Llista de widgets a mostrar en la pantalla de detalls
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Poster i títol de la beguda
                _PosterAndTitile(drink: drink),
                // Resum i descripció de la beguda
                _Overview(drink: drink),
                // Secció "Potser també t'agradarà"
                Text(
                  "Potser també t'agradarà",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Targetes de recomanacions relacionades amb la beguda actual
                CastingCards(int.parse(drink.idDrink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Appbar personalitzada amb la imatge de la beguda com a fons
class _CustomAppBar extends StatelessWidget {
  final Drink drink;

  const _CustomAppBar({Key? key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            drink.strDrink,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(drink.strDrinkThumb),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Widget que mostra el poster i el títol de la beguda
class _PosterAndTitile extends StatelessWidget {
  final Drink drink;

  const _PosterAndTitile({Key? key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Poster de la beguda
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(drink.strDrinkThumb),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Títol, subtítol i puntuació de la beguda
          Expanded(
            child: Column(
              children: [
                Text(
                  drink.strDrink,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  drink.strDrink,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('12', style: textTheme.caption),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget que mostra el resum i la descripció de la beguda
class _Overview extends StatelessWidget {
  final Drink drink;

  const _Overview({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        description(drink),
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  // Mètode que retorna una descripció aleatòria per a la beguda
  String description(Drink drink) {
    List<String> drinkDescriptions = [
      "Una refrescant barreja de fruites tropicals i sabors cítrics, perfecta per a un dia calorós d'estiu.",
      "Una barreja rica i avelletada d'infusió de xocolata, una delícia per als amants del xocolata.",
      "Una barreja energètica de cítrics i herbes, creant una beguda agredolça i vigoritzant.",
      "Una barreja suau i cremosa de vainilla i caramel, reminiscent d'un postres decadent.",
      "Una fusió vibrants i àcida de mores, creant una explosió de bondat fruitera.",
      "Una barreja càlida d'espècies i herbes, perfecta per acollir-se en una nit fresca.",
      "Un paradís tropical en una copa, amb notes de coco, pinya i un toc de rom.",
      "Una combinació sofisticada d'espresso i llet escumada, una delícia per als amants del café.",
      "Una beguda efervescent amb un toc de cítrics, perfecta per a celebracions.",
      "Una beguda mentolada i refrescant que deixa una sensació fresca amb cada glop.",
      "Una barreja dolça i indulgent de caramel, toffee i una mica de sal marina.",
      "Una infusió robusta i intensa de te, accentuada amb espècies per a una experiència amb sabor.",
      "Una melodia fruitera de melons, mores i cítrics, creant una explosió de sabors estiuencs.",
      "Una concoctió clàssica de soda i xarop, amb un toc del teu sabor de fruita preferit.",
      "Una barreja exòtica d'espècies i sucs de fruita, transportant-te a terres llunyanes.",
      "Una barreja cremosa i somiadora de coco i pinya, com una escapada tropical en una copa.",
      "Una beguda vibrants i colorida amb capes de sucs de fruita, creant una experiència visual impressionant.",
      "Una infusió herbal amb suau camamilla i notes de lavanda, perfecta per a la relaxació.",
      "Una beguda efervescent i cítrica amb un raig de granadina, creant una combinació dolça i àcida.",
      "Una mescla sofisticada de whisky, bitter i un cub de sucre, per a un còctel clàssic atemporal."
    ]; // Obtenim un índex aleatori basat en el valor hash de la beguda
    int randomIndex = drink.hashCode % drinkDescriptions.length;

    // Retornem la descripció aleatòria
    return drinkDescriptions[randomIndex];
  }
}

class GetDetails extends StatelessWidget {
  final int id;

  const GetDetails(this.id);

  @override
  Widget build(BuildContext context) {
    // Obtenim l'instància del proveïdor de begudes mitjançant Provider
    final cocktailsProvider =
        Provider.of<CocktailsProvider>(context, listen: false);
    FullDrink fullDrink;
    // Utilitzem un FutureBuilder per gestionar la càrrega de les recomanacions de begudes
    return Visibility(
      visible: cocktailsProvider.detallsBeguda[1] == null,
      child: Container(
        child: Center(child: CircularProgressIndicator()),
      ),
      replacement:
        //i need another widget here  
    );
  }
}
