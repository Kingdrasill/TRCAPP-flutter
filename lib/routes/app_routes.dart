import 'package:tcc_app/views/pages/about_page.dart';
import 'package:tcc_app/views/pages/create_page.dart';
import 'package:tcc_app/views/pages/create_partitura_page.dart';
import 'package:tcc_app/views/pages/home_page.dart';
import 'package:tcc_app/views/pages/learn_page.dart';
import 'package:tcc_app/views/pages/practice_page.dart';
import 'package:tcc_app/views/pages/select_partitura_page.dart';

abstract class AppRoutes {
  static const String ABOUT = 'ABOUT';
  static const String HOME = 'HOME';
  static const String LEARN = 'LEARN';
  static const String PRACTICE = 'PRACTICE';
  static const String SELECT = 'SELECT';
  static const String CREATE = 'CREATE';
  static const String PARTITURA = 'PARTITURA';

  static final routes = {
    ABOUT: (context) => AboutPage(),
    HOME: (context) => HomePage(),
    LEARN: (context) => LearnPage(),
    PRACTICE: (context) => PracticePage(),
    SELECT: (context) => SelecionarPartitura(),
    CREATE: (context) => CreatePage(),
    PARTITURA: (context) => CreatePartituraPage(),
  };
}