import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:dart_angular2_tour_of_heroes/dashboard_component.dart';
import 'package:dart_angular2_tour_of_heroes/heroes_component.dart';
import 'package:dart_angular2_tour_of_heroes/hero_detail_component.dart';
import 'package:dart_angular2_tour_of_heroes/hero_service.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS, HeroService]
)
@RouteConfig(const [
  const Route(
      path: '/heroes',
      name: 'Heroes',
      component: HeroesComponent),
  const Route(
      path: '/dashboard',
      name: 'Dashboard',
      component: DashboardComponent,
      useAsDefault: true),
  const Route(
      path: '/detail/:id',
      name: 'HeroDetail',
      component: HeroDetailComponent),
])
class AppComponent {
  final String title = 'Tour of Heroes';
}