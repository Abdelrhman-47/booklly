import 'package:booklly/core/routing/app_routs.dart';
import 'package:booklly/features/presintation/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presintation/views/splash_view.dart';

class AppRouter {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
        case AppRouts.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('404 Not Found'))),
        );
    }
  }
}
