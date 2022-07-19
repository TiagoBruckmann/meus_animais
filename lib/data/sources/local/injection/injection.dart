// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injection.config.dart';

final getIt = GetIt.I;

String env = "firebase";
// String env = "api";

@InjectableInit()
void configureDependencies() => $initGetIt(getIt, environment: env);