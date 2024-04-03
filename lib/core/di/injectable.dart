import 'package:gauthentication/core/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
@InjectableInit(preferRelativeImports: true, asExtension: false)
void configureDependencies() => init(getIt);
