import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tcc_app/data/database/database.dart';
import 'package:tcc_app/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(224,224,224, 1),
  100: Color.fromRGBO(224,224,224, 1),
  200: Color.fromRGBO(224,224,224, 1),
  300: Color.fromRGBO(224,224,224, 1),
  400: Color.fromRGBO(224,224,224, 1),
  500: Color.fromRGBO(224,224,224, 1),
  600: Color.fromRGBO(224,224,224, 1),
  700: Color.fromRGBO(224,224,224, 1),
  800: Color.fromRGBO(224,224,224, 1),
  900: Color.fromRGBO(224,224,224, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFE0E0E0, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Provider(
      create: (context) => AppDatabase().partituraDao,
      child: MaterialApp(
        title: 'TCC',
        theme: ThemeData(
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.HOME,
        routes: AppRoutes.routes,
      ),
      dispose: (context, db) => db.close(),
    );

  }
}
