import '../../../data/datasources/remote/app_api.dart';
import '../app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final AppApi appApi;

  AppRepositoryImpl({
    required this.appApi,
  });
}
