// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injection.config.dart';

final getIt = GetIt.I;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt, environment: "firebase");