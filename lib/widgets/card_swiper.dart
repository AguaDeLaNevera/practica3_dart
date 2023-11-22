import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/drink.dart';

// Widget que mostra un Swiper de cartes de begudes
class CardSwiper extends StatelessWidget {
  final List<Drink> drinks;

  // Constructor que rep una llista de begudes com a paràmetre
  const CardSwiper({Key? key, required this.drinks}) : super(key: key);

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

    // Si hi ha begudes, mostrem el Swiper
    return Container(
      width: double.infinity,
      // Aquest multiplicador estableix el percentatge de pantalla ocupada (50%)
      height: size.height * 0.5,
      child: Swiper(
        itemCount: drinks.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          final drink = drinks[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: drink),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(drink.strDrinkThumb),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
