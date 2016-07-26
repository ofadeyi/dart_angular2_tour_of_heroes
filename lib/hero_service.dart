import 'dart:async';
import 'package:angular2/core.dart';

import 'package:dart_angular2_tour_of_heroes/hero.dart';
import 'package:dart_angular2_tour_of_heroes/mock_heroes.dart';


@Injectable()
class HeroService {

  Future<Hero> getHero(int id) async =>
      (await getHeroes()).firstWhere((hero) => hero.id == id);

  Future<List<Hero>> getHeroes() async => mockHeroes;

  Future<List<Hero>> getHeroesSlowly() {
    return new Future.delayed(const Duration(seconds: 2), () => mockHeroes);
  }
}