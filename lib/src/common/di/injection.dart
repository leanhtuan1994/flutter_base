import 'package:flutter_base/src/common/network/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/impl/app_repository_impl.dart';
import '../../presentation/common/language/impl/cubit/language_cubit.dart';
import '../../presentation/common/language/impl/language_interactor_impl.dart';

import '../../data/datasources/local/data_manager.dart';
import '../../data/datasources/remote/app_api.dart';
import '../../data/repositories/app_repository.dart';

part 'modules/api_module.dart';
part 'modules/bloc_module.dart';
part 'modules/repository_module.dart';
part 'modules/components_module.dart';

GetIt getIt = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
