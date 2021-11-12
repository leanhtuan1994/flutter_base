import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../common/constants.dart';
import '../common/di/injection.dart';
import '../presentation/common/language/impl/cubit/language_cubit.dart';
import '../presentation/features/routes.dart';
import '../data/datasources/local/data_manager.dart';
import '../common/routes/route_observer.dart';

class Application extends StatelessWidget {
  const Application({
    Key? key,
  }) : super(key: key);

  static final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey();

  String get initialRoute {
    final DataManager dataManager = getIt.get<DataManager>();
    final isFirstOpen = dataManager.isFirstOpenApp();

    if (isFirstOpen) {
      dataManager.saveFirstOpenApp();

      return RouteList.onboarding;
    }

    return RouteList.home;
  }

  List<BlocProvider> _getProviders() => [
        BlocProvider<LanguageCubit>(
          create: (BuildContext context) => getIt<LanguageCubit>(),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
              restorationScopeId: 'app',
              navigatorKey: appNavigatorKey,
              navigatorObservers: [AppRouteObserver()],
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.supportedLocales,
              locale: Locale(state.language),
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              initialRoute: initialRoute,
              onGenerateRoute: Routes.generateRoute,
              builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child ?? Container()));
        },
      ),
    );
  }
}
