import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/drink.dart';

class CardSwiper extends StatelessWidget {
  final List<Drink> drinks;

  const CardSwiper({super.key, required this.drinks});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.drinks.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
        width: double.infinity,
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
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
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
