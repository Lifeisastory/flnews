
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/scaffold.dart';
import '../ui/scaffold_viewmodel.dart';
import 'routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.start,
  routes: [
    GoRoute(
      path: Routes.start,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => CustomScaffoldViewModel(),
          child: CustomScaffold(),
        );
      },
    ),
  ],
);
