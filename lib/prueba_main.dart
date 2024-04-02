
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testing/src/core/Widgets/dialog.dart';
import 'package:testing/src/core/localization/app_localization.dart';
import 'package:testing/src/core/routes/app_router.dart';
import 'package:testing/src/core/routes/route_paths.dart';
import 'package:testing/src/data/services/navigator_service.dart';
import 'package:testing/src/modules/alerts/alert_cubit.dart';
import 'package:testing/src/modules/session/session_cubit.dart';

import 'src/core/values/enum.dart';

class TestAPP extends StatelessWidget {
  const TestAPP({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlertCubit>(
            lazy: false, create: (contextA) => AlertCubit()),
        BlocProvider<SessionCubit>(
            create: (contextB) => SessionCubit()..verify()),
      ],
      child: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //Key to show global snackbars
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba',
      onGenerateRoute: routes,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      navigatorKey: NavigatorService.navigatorKey,
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'), // Spanish
      ],
      // theme: ThemeApp.themeLight,
      scaffoldMessengerKey: scaffoldMessengerKey,
      builder: (context, child) => MultiBlocListener(
        listeners: [
          BlocListener<AlertCubit, AlertState>(
            listener: (context, state) {
              if (state is ShowDialogEvent) {
                GlobalDialog.show(
                  context: NavigatorService.navigatorKey.currentState!.context,
                  title: state.title,
                  message: state.message,
                  type: state.type,
                  onTap: () {
                    if (state.onTap != null) {
                      state.onTap!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  actions: state.actions,
                  error: state.error,
                  metadata: state.metadata,
                );
              }
            },
          ),
          BlocListener<SessionCubit, SessionState>(
            listenWhen: (previous, current) => previous.sessionStatus != current.sessionStatus,
            listener: (context, state) {
              if (state.sessionStatus == SessionStatus.started) {
                NavigatorService.pushNamedAndRemoveUntil(Routes.home);
              }
            },
          ),
        ],
        child: child!,
      ),
    );
  }
}
