import 'package:app_name/configuration/model/environment_model.dart';
import 'package:app_name/di/main_provider.dart';
import 'package:app_name/repo/local/local_repository.dart';
import 'package:app_name/repo/remote/rest_repository.dart';
import 'package:app_name/routes/appname_parser.dart' show parseRoute;
import 'package:app_name/routes/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:simple_router/simple_router.dart';

void main() {
  runApp(const AppNameApp());
}

class AppNameApp extends StatelessWidget {
  const AppNameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ..._services,
      ],
      builder: (context, child) {
        final mainProvider = context.read<MainProvider>();
        return MaterialApp.router(
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          routerDelegate: mainProvider.router,
          backButtonDispatcher: SimpleBackButtonDispatcher(mainProvider.router),
          routeInformationParser: SimpleRouteInformationParser(parseRoute),
        );
      },
    );
  }

  List<SingleChildWidget> get _services {
    final localRepository = LocalRepository();
    final remoteRepo = RestRepository(config: _config);
    final router = SimpleRouter(
      defaultRoute: SplashRoute(),
      handleAppExit: (context) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Exit'),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Exit'),
                ),
              ],
            );
          },
        );
      },
    );
    return [
      Provider<RestRepository>(create: (context) => remoteRepo),
      Provider<LocalRepository>(create: (context) => localRepository),
      ChangeNotifierProvider(
        create: (context) {
          return MainProvider(
            localRepository: localRepository,
            remoteRepository: remoteRepo,
            router: router,
          );
        },
      ),
    ];
  }

  EnvironmentModel get _config => EnvironmentModel.test();
}
