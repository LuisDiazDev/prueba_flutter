import 'package:flutter/material.dart';
import 'package:testing/src/modules/home/home_screen.dart';
import 'package:testing/src/modules/splash_screen.dart';
import 'not_found_screen.dart';
import 'route_paths.dart';

Route Function(RouteSettings) get routes => (RouteSettings settings) {
  Route route;
  switch (settings.name) {
    case Routes.initial:
      route = MaterialPageRoute(
        builder: (c) => const SplashScreen(),
        settings: RouteSettings(name: settings.name),
      );
      break;
    case Routes.home:
      route = MaterialPageRoute(
        builder: (c) => const HomePage(),
        settings: RouteSettings(name: settings.name),
      );
      break;
    default:
      route = MaterialPageRoute(
        builder: (c) => const NotFoundScreen(), //Home page
        settings: RouteSettings(name: settings.name),
      );
      break;
  }

  return route;
};

