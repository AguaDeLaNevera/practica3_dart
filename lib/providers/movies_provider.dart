import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{
  MoviesProvider(){
    print('Movies provider inicialitzat!');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async{
    print('getOnDisplayMovies');
  }
}