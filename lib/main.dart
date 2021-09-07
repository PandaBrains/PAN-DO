import 'package:flutter/material.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/init/navigation/navigation_route.dart';
import 'package:pan_do/core/init/navigation/navigation_service.dart';
import 'package:pan_do/core/init/notifier/provider_list.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/theme_notifier.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: ApplicationConstants.IS_DEVELOPMENT,
      theme: context.watch<ThemeNotifier>().currentTheme,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
