import 'package:flutter/material.dart';

import 'constats.dart';
import 'features/splash/presintation/views/splash_view.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashView(),
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor)

    );
  }
}

