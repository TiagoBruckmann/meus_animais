// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injection.config.dart';

final getIt = GetIt.I;

const String env = "firebase";
// const String env = "api";
// const String env = "test";

@InjectableInit()
void configureDependencies() => $initGetIt(getIt, environment: env);