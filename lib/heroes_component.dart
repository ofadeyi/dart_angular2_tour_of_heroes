// Copyright (c) 2016, ofadeyi. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'hero.dart';
import 'hero_service.dart';

@Component(
    selector: 'my-heroes',
    templateUrl: 'heroes_component.html',
    styleUrls: const ['heroes_component.css']
)
class HeroesComponent implements OnInit {
  List<Hero> heroes;
  Hero selectedHero;
  final HeroService _heroService;
  final Router _router;

  HeroesComponent(this._heroService, this._router);

  onSelect(Hero hero) {
    selectedHero = hero;
  }

  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  @override
  void ngOnInit() {
    getHeroes();
  }

  Future<Null> gotoDetail() =>
      _router.navigate([
        'HeroDetail',
        {'id': selectedHero.id.toString()}
      ]);

  Future<Null> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return;
    heroes.add(await _heroService.create(name));
    selectedHero = null;
  }

  Future<Null> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selectedHero == hero) selectedHero = null;
  }
}