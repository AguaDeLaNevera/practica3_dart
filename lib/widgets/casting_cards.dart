import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/cocktails_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int id;

  const CastingCards(this.id);

  @override
  Widget build(BuildContext context) {
    final cocktailsProvider =
        Provider.of<CocktailsProvider>(context, listen: false);

    // You need to return the FutureBuilder widget here
    return FutureBuilder(
      future: cocktailsProvider.getOnDisplayedRecommendations(id),
      builder: (BuildContext context, AsyncSnapshot<List<Drink>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
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

class _CastCard extends StatelessWidget {
  final Drink casting;
  const _CastCard({super.key, required this.casting});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 100,
        // color: Colors.green,
        child: ListView(children: [
          Column(
            children: [
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
              const SizedBox(
                height: 5,
              ),
              Text(
                casting.strDrink,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ]));
  }
}
