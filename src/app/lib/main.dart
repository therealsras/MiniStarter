import 'package:bot_toast/bot_toast.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/config.dart';
import 'helpers/helpers.dart';
import 'models/app_model.dart';
import 'models/models.dart';
import 'router/router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  if (isDesktop()) {
    await DesktopWindow.setWindowSize(const Size(600, 600));
    await DesktopWindow.setMinWindowSize(const Size(260, 600));
  }
  await dotenv.load(fileName: ".env");
  final container = ProviderContainer();
  container.read(appStateProvider).initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appModel = ref.watch(appStateProvider);
    final profileModel = ref.watch(profileProvider);
    final appRouter = AppRouter(appModel, profileModel);
    
    // getIt.registerSingleton<AppRouter>(appRouter);
    //  MaterialTheme appTheme = MaterialTheme(AppTheme.lightTextTheme);
    ThemeData theme;
    if (profileModel.darkMode) {
      theme = AppTheme.dark();
    } else {
      theme = AppTheme.light();
    }
    return FutureBuilder(
      future: appModel.fetchLocale(),
      builder: (context, snapshot) => MaterialApp.router(
        title: 'MINI APP',
        debugShowCheckedModeBanner: false,
        theme: theme,
        locale: appModel.appLocale,
        supportedLocales: AppModel.supportedLanguage,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          
        ],
        builder: BotToastInit(),
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        routeInformationProvider: appRouter.router.routeInformationProvider
      ),
    );
  }
}

