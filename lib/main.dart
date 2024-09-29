import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task_project/firebase_options.dart';
import 'package:interview_task_project/l10n/l10n.dart';
import 'package:interview_task_project/view_model/localization_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'view/auth/sign_in.dart';
import 'view_model/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocalizationProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

    return Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, child) {
      return MaterialApp(
        locale: localizationProvider.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: HexColor('#F8F8F8'),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: WidgetStateProperty.all(HexColor('#34C88A')),
          )),
          colorScheme: kColorScheme,
          primaryColor: HexColor('#34C88A'),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: HexColor('#34C88A'),
          ),
          textTheme: const TextTheme().copyWith(
            headlineMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(.85)),
            headlineSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(.85),
            ),
            headlineLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor('#194866'),
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              color: HexColor('#194866'),
            ),
          ),
        ),
        home: SignInPage(),
      );
    });
  }
}
