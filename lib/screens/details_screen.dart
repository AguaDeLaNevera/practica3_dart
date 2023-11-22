import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Drink beguda = ModalRoute.of(context)?.settings.arguments as Drink;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            drink: beguda,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(
                  drink: beguda,
                ),
                _Overview(
                  drink: beguda,
                ),
                Text(
                  "You may also like",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                CastingCards(int.parse(beguda.idDrink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Drink drink;

  const _CustomAppBar({super.key, required this.drink});
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

class _PosterAndTitile extends StatelessWidget {
  final Drink drink;

  const _PosterAndTitile({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
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
            const SizedBox(
              width: 20,
            ),
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
        ));
  }
}

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

  String description(Drink drink) {
    List<String> drinkDescriptions = [
      "A refreshing blend of tropical fruits and citrus flavors, perfect for a hot summer day.",
      "A rich and velvety chocolate-infused concoction, a treat for any chocolate lover.",
      "An energizing mix of citrus and herbs, creating a zesty and invigorating beverage.",
      "A smooth and creamy blend of vanilla and caramel, reminiscent of a decadent dessert.",
      "A vibrant and tangy fusion of berries, creating a burst of fruity goodness.",
      "A warming blend of spices and herbs, perfect for cozying up on a chilly evening.",
      "A tropical paradise in a glass, with hints of coconut, pineapple, and a touch of rum.",
      "A sophisticated combination of espresso and frothy milk, a coffee lover's delight.",
      "A bubbly and effervescent drink with a hint of citrus, perfect for celebrations.",
      "A minty and refreshing beverage that leaves a cool sensation with every sip.",
      "A sweet and indulgent mix of caramel, toffee, and a touch of sea salt.",
      "A bold and robust infusion of tea, accented with spices for a flavorful experience.",
      "A fruity medley of melons, berries, and citrus, creating a burst of summer flavors.",
      "A classic concoction of soda and syrup, with a twist of your favorite fruit flavor.",
      "An exotic blend of spices and fruit juices, transporting you to distant lands.",
      "A creamy and dreamy blend of coconut and pineapple, like a tropical escape in a glass.",
      "A vibrant and colorful drink with layers of fruit juices, creating a visually stunning experience.",
      "A herbal infusion with soothing chamomile and hints of lavender, perfect for relaxation.",
      "A fizzy and citrusy soda with a splash of grenadine, creating a sweet and tart combination.",
      "A sophisticated mix of whiskey, bitters, and a sugar cube, for a timeless classic cocktail."
    ];
    int randomIndex = drink.hashCode % drinkDescriptions.length;
    return drinkDescriptions[randomIndex];
  }
}
