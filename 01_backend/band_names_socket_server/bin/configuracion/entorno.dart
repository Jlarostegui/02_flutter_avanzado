import 'package:dotenv/dotenv.dart';

abstract class Entorno {
  static final cargar = DotEnv(includePlatformEnvironment: true)
    ..load(['.env']);
  static final int puerto = 3000;
}
