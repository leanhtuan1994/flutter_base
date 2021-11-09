import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../common/di/injection.dart';
import '../presentation/common/language/impl/cubit/language_cubit.dart';
import '../presentation/features/routes.dart';

class Application extends StatelessWidget {
  const Application({
    Key? key,
  }) : super(key: key);

  String get initialRoute {
    return 'onboarding';
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
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(state.language),
              theme: ThemeData(),
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
