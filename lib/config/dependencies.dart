
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/repositories/site/site_repository.dart';
import '../../data/repositories/site_config/site_config_repository.dart';
import '../data/services/api/api_client_service.dart';
import '../data/services/local/local_database_service.dart';
import '../data/services/local/database/db/database.dart';
import '../global/states.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(
      create: (context) => AppDatabase(), 
      dispose: (context, db) => db.close(),
    ),
    Provider(create: (context) => ApiClientService()),
    Provider(
      create: (context) => LocalDatabaseService(databaseSvc: context.read()),
    ),
    Provider(
      create:
          (context) => SiteRepository(
            apiClientSvc: context.read(),
            localDatabaseSvc: context.read(),
          ),
    ),
    Provider(
      create:
          (context) => SiteConfigRepository(localDatabaseSvc: context.read()),
    ),
    ChangeNotifierProvider(create: (context) => GlobalState())
  ];
}
