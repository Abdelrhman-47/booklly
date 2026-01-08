import 'package:booklly/core/routing/app_router.dart';
import 'package:booklly/core/routing/app_routs.dart';
import 'package:booklly/core/utiles/hive_init.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constats.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      initialRoute: AppRouts.splash,
      onGenerateRoute: (settings) => AppRouter.generateRout(settings),
    );
  }
}
