import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:dart_angular2_tour_of_heroes/hero.dart';
import 'package:dart_angular2_tour_of_heroes/hero_service.dart';

@Component(
    selector: 'my-dashboard',
    templateUrl: 'dashboard_component.html',
    styleUrls: const ['dashboard_component.css']
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;
  final HeroService _heroService;
  final Router _router;

  DashboardComponent(this._heroService, this._router);

  Future<Null> ngOnInit() async {
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }

  gotoDetail(Hero hero) {
    var link = [
      'HeroDetail',
      {'id': hero.id.toString()}
    ];
    _router.navigate(link);
  }
}